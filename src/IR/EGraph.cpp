#include "caffeine/IR/EGraph.h"
#include "caffeine/Config.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationData.h"
#include "caffeine/Support/LLVMFmt.h"
#include <cstdint>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <limits>
#include <llvm/IR/Function.h>

namespace caffeine {

bool ENode::operator==(const ENode& node) const {
  if (operands != node.operands)
    return false;

  if (data == node.data)
    return true;
  if ((bool)data != (bool)node.data)
    return false;

  return *data == *node.data;
}
bool ENode::operator!=(const ENode& node) const {
  return !(*this == node);
}

Type ENode::type() const {
  return data ? data->type() : Type::void_ty();
}
Operation::Opcode ENode::opcode() const {
  return data ? data->opcode() : Operation::Invalid;
}
bool ENode::is_constant() const {
  switch (opcode()) {
  case Operation::ConstantInt:
  case Operation::ConstantFloat:
    return true;
  default:
    return false;
  }
}

llvm::hash_code hash_value(const ENode& node) {
  using llvm::hash_value;

  return llvm::hash_combine(
      node.data ? hash_value(*node.data) : hash_value(node.data.get()),
      llvm::hash_combine_range(node.operands.begin(), node.operands.end()));
}

void EClassCache::clear() {
  *this = EClassCache();
}

EClass::EClass(std::vector<ENode>&& nodes) : nodes(nodes) {
  auto it = std::find_if(nodes.begin(), nodes.end(),
                         [](const ENode& node) { return node.is_constant(); });
  if (it != nodes.end())
    constant_index = it - nodes.begin();
}

bool EClass::operator==(const EClass& eclass) const {
  return nodes == eclass.nodes && parents == eclass.parents;
}
bool EClass::operator!=(const EClass& eclass) const {
  return !(*this == eclass);
}

llvm::hash_code hash_value(const EClass& eclass) {
  using llvm::hash_value;

  return llvm::hash_combine(
      llvm::hash_combine_range(eclass.nodes.begin(), eclass.nodes.end()),
      llvm::hash_combine_range(eclass.parents.begin(), eclass.parents.end()));
}

void EClass::merge(EClass&& eclass) {
  CAFFEINE_ASSERT(this != &eclass);
  CAFFEINE_ASSERT(type() == eclass.type());

  size_t start = nodes.size();

  nodes.insert(nodes.end(), std::move_iterator(eclass.nodes.begin()),
               std::move_iterator(eclass.nodes.end()));
  for (auto it = eclass.parents.begin(); it != eclass.parents.end(); ++it) {
    parents.emplace(it.key(), it.value());
  }

  if (eclass.constant_index.has_value()) {
    if (!constant_index.has_value()) {
      constant_index = start + *eclass.constant_index;
      cache = std::move(eclass.cache);
    }
  } else if (cache.cost.has_value() && eclass.cache.cost.has_value()) {
    auto [cost1, index1] = *cache.cost;
    auto [cost2, index2] = *cache.cost;

    if (cost1 < cost2) {
      cache.cost = {cost1, index1};
      // keep existing expression
    } else {
      cache.cost = {cost2, index2};
      cache.expr = std::move(eclass.cache.expr);
    }
  } else {
    cache.clear();
  }
}

bool EClass::is_constant() const {
  return constant_index.has_value();
}

Type EClass::type() const {
  return nodes.front().data->type();
}

size_t EGraph::find(size_t id) const {
  return union_find.find(id);
}
size_t EGraph::find(size_t id) {
  return union_find.find(id);
}

EClass* EGraph::get(size_t id) {
  auto it = classes.find(find(id));
  if (it != classes.end())
    return &it->second;
  return nullptr;
}
const EClass* EGraph::get(size_t id) const {
  auto it = classes.find(find(id));
  if (it != classes.end())
    return &it->second;
  return nullptr;
}

size_t EGraph::merge(size_t id1, size_t id2) {
  id1 = find(id1);
  id2 = find(id2);

  if (id1 == id2)
    return id1;

  auto new_id = union_find.do_union(id1, id2);

  classes.at(new_id).merge(std::move(classes.at(id2)));
  classes.erase(id2);

  worklist.push_back(new_id);
  updated.insert(new_id);
  return new_id;
}

ENode EGraph::canonicalize(const ENode& node) {
  auto operands = node.operands;
  for (size_t& operand : operands)
    operand = find(operand);

  return ENode{node.data, std::move(operands)};
}

size_t EGraph::add(const ENode& node) {
  auto canonical = canonicalize(node);
  auto it = hashcons.find(canonical);
  if (it != hashcons.end())
    return it->second;

  auto eclass_id = create_eclass(canonical);
  for (size_t child : canonical.operands) {
    classes.at(child).parents.emplace(canonical, eclass_id);
  }

  hashcons.emplace(canonical, eclass_id);
  updated.insert(eclass_id);

  return eclass_id;
}
size_t EGraph::add(const Operation& op) {
  if (auto node = llvm::dyn_cast<EGraphNode>(&op))
    return node->id();

  llvm::SmallVector<size_t, 2> operands;
  operands.reserve(op.num_operands());

  for (const auto& operand : op.operands()) {
    operands.push_back(add(operand));
  }

  return add(ENode{op.data(), std::move(operands)});
}

size_t EGraph::add_merge(size_t eclass_id, const ENode& node) {
  auto [it, inserted] = hashcons.emplace(node, eclass_id);
  if (!inserted)
    return merge(eclass_id, it->second);

  EClass& eclass = classes.at(eclass_id);
  eclass.merge(EClass{{node}});

  worklist.push_back(eclass_id);
  updated.insert(eclass_id);
  return eclass_id;
}

std::optional<size_t> EGraph::classof(const ENode& node) const {
  auto it = hashcons.find(node);
  if (it == hashcons.end())
    return std::nullopt;
  return find(it->second);
}

void EGraph::rebuild() {
  using std::swap;

  tsl::hopscotch_set<size_t> cache_visited;
  llvm::SmallVector<size_t> cache_stack;

  std::vector<size_t> todo;
  while (!worklist.empty()) {
    swap(todo, worklist);

    for (size_t eclass : todo) {
      eclass = find(eclass);
      repair(eclass);

      for (const auto& [node, parent] : classes.at(eclass).parents) {
        cache_stack.push_back(parent);
      }
    }

    todo.clear();
  }

  // Clear out cached values for expressions that have been modified.
  while (!cache_stack.empty()) {
    size_t id = cache_stack.pop_back_val();
    if (!cache_visited.insert(id).second)
      continue;

    EClass* eclass = get(id);

    eclass->cache.clear();
    updated.insert(id);

    for (const auto& [node, parent] : eclass->parents) {
      if (!cache_visited.contains(parent))
        cache_stack.push_back(parent);
    }
  }
}

void EGraph::repair(size_t eclass_id) {
  EClass& eclass = classes.at(eclass_id);

  if (eclass.is_constant())
    unparent(eclass_id);

  // Note: merge actually properly handles updating the cache so we don't clear
  //       the cache here. However, that doesn't apply for parents of this
  //       eclass so rebuild will handle that by clearing the cache for all
  //       transitive parents of this eclass.

  for (const auto& [p_node, p_eclass] : eclass.parents) {
    auto canonical = canonicalize(p_node);

    hashcons.erase(p_node);
    hashcons.insert_or_assign(canonical, find(p_eclass));
  }

  tsl::hopscotch_map<ENode, size_t> new_parents;
  new_parents.reserve(eclass.parents.size());
  for (const auto& [p_node, p_eclass] : eclass.parents) {
    auto canonical = canonicalize(p_node);

    auto it = new_parents.find(canonical);
    if (it != new_parents.end()) {
      it.value() = merge(p_eclass, it->second);
    } else {
      new_parents.insert({canonical, find(p_eclass)});
    }
  }

  eclass.parents = new_parents;

  for (ENode& node : eclass.nodes)
    node = canonicalize(node);
}

void EGraph::unparent(size_t eclass_id) {
  EClass& eclass = classes.at(eclass_id);
  CAFFEINE_ASSERT(eclass.is_constant());

  if (eclass.nodes.size() == 1)
    return;

  for (const ENode& node : eclass.nodes) {
    for (size_t operand : node.operands) {
      get(operand)->parents.erase(node);
    }
  }

  std::swap(eclass.nodes.front(), eclass.nodes[*eclass.constant_index]);
  eclass.nodes.resize(1);
  eclass.constant_index = 0;
}

size_t EGraph::create_eclass(const ENode& node) {
  size_t id = union_find.make_set();
  classes.emplace(id, EClass{{node}});
  hashcons.emplace(node, id);
  worklist.push_back(id);
  return id;
}

OpRef EGraph::extract(size_t id) {
  return EGraphExtractor(this).extract(id);
}
OpRef EGraph::extract(size_t id) const {
  return EGraphExtractor(this).extract(id);
}

OpRef EGraph::extract(const Operation& op) {
  return EGraphExtractor(this).extract(op);
}
OpRef EGraph::extract(const Operation& op) const {
  return EGraphExtractor(this).extract(op);
}

std::string EGraph::DebugString() const {
  std::string result = "EGraph {\n";
  for (const auto& [eclass_id, eclass] : classes) {
    fmt::format_to(std::back_inserter(result), "  eclass {}:\n", eclass_id);

    for (const ENode& enode : eclass.nodes) {
      std::string opcode{Operation::opcode_name(enode.opcode())};
      std::transform(opcode.begin(), opcode.end(), opcode.begin(),
                     [](unsigned char c) { return std::tolower(c); });

      if (auto data = llvm::dyn_cast<ConstantIntData>(enode.data.get())) {
        fmt::format_to(std::back_inserter(result), "    ({} {})\n",
                       enode.type(), data->value());
      } else if (auto data =
                     llvm::dyn_cast<ConstantFloatData>(enode.data.get())) {
        fmt::format_to(std::back_inserter(result), "    ({} {})\n",
                       enode.type(), data->value());
      } else if (auto data = llvm::dyn_cast<ConstantData>(enode.data.get())) {
        fmt::format_to(std::back_inserter(result), "    (const.{} {})\n",
                       enode.type(), data->symbol());
      } else if (auto data =
                     llvm::dyn_cast<FunctionObjectData>(enode.data.get())) {
        fmt::format_to(std::back_inserter(result), "    (function {})\n",
                       data->function()->getName().str());
      } else {
        fmt::format_to(std::back_inserter(result), "    ({} {})\n", opcode,
                       fmt::join(enode.operands, " "));
      }
    }
  }

  fmt::format_to(std::back_inserter(result), "}}\n");
  return result;
}
void EGraph::DebugPrint() const {
  fmt::print("{}", DebugString());
}

EGraphExtractor::EGraphExtractor(const EGraph* graph)
    : graph(graph), is_const(true) {}
EGraphExtractor::EGraphExtractor(EGraph* graph)
    : graph(graph), is_const(false) {}

EClassCost EGraphExtractor::eval_cost(size_t eclass_id) {
  const EClass& eclass = *graph->get(eclass_id);
  if (eclass.cache.cost)
    return eclass.cache.cost.value();

  eclass_id = graph->find(eclass_id);
  auto it = costs.find(eclass_id);
  if (it != costs.end())
    return it->second;

  if (!visited.insert(eclass_id).second) {
    // We've encountered a cycle in the expression tree. In this case we just
    // return a large so that the cycle doesn't get chosen.
    //
    // Note that the only way it is possible to get a cycle is if classes were
    // merged in such a way that a cycle is formed. There will always be an
    // alternative in that case.
    return {UINT32_MAX, SIZE_MAX};
  }

  uint64_t cost = UINT64_MAX;
  size_t index = SIZE_MAX;
  for (size_t i = 0; i < eclass.nodes.size(); ++i) {
    uint64_t node_cost = eval_cost(eclass.nodes[i]);
    if (node_cost < cost) {
      cost = node_cost;
      index = i;
    }
  }

  CAFFEINE_ASSERT(index != SIZE_MAX);
  update_cached(eclass_id, {cost, index});
  return {cost, index};
}
uint64_t EGraphExtractor::eval_cost(const ENode& node) {
  uint64_t cost = eval_cost(node.data->opcode());
  for (size_t operand : node.operands)
    cost += eval_cost(operand).cost;
  return cost;
}
uint64_t EGraphExtractor::eval_cost(Operation::Opcode opcode) {
  using Opcode = Operation::Opcode;

  switch (opcode) {
  // Symbolic constants are expensive, better to use a large non-symbolic
  // expression instead.
  case Opcode::ConstantNamed:
  case Opcode::ConstantNumbered:
  case Opcode::ConstantArray:
    return 1 << 16;

  default:
    return 1;
  }
}

void EGraphExtractor::update_cached(size_t eclass_id, const OpRef& expr) {
  expressions.emplace(eclass_id, expr);

  if (is_const)
    return;

  EGraph* egraph = const_cast<EGraph*>(graph);
  EClass* eclass = egraph->get(eclass_id);
  if (!eclass)
    return;

  eclass->cache.expr = expr;
}
void EGraphExtractor::update_cached(size_t eclass_id, EClassCost cost) {
  costs.emplace(eclass_id, cost);

  if (is_const)
    return;

  EGraph* egraph = const_cast<EGraph*>(graph);
  EClass* eclass = egraph->get(eclass_id);
  if (!eclass)
    return;

  eclass->cache.cost = cost;
}

OpRef EGraphExtractor::extract(size_t id) {
  id = graph->find(id);

  const EClass& eclass = *graph->get(id);
  if (eclass.cache.expr)
    return eclass.cache.expr;

  auto it = expressions.find(id);
  if (it != expressions.end())
    return it->second;

  auto [cost, index] = eval_cost(id);
  const ENode& node = eclass.nodes.at(index);

  llvm::SmallVector<OpRef, 4> operands;
  operands.reserve(node.operands.size());

  for (size_t opid : node.operands)
    operands.push_back(extract(opid));

  OpRef expr = Operation::CreateRaw(node.data, operands);
  update_cached(id, expr);
  return expr;
}
OpRef EGraphExtractor::extract(const Operation& expr) {
  if (auto node = llvm::dyn_cast<EGraphNode>(&expr))
    return extract(node->id());

  llvm::SmallVector<OpRef, 3> operands;
  operands.reserve(expr.num_operands());

  for (const auto& operand : expr.operands()) {
    operands.push_back(extract(operand));
  }

  return expr.with_new_operands(operands);
}

} // namespace caffeine
