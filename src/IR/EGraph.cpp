#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/Operation.h"
#include <algorithm>
#include <cstdint>
#include <deque>
#include <iterator>
#include <limits>

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

llvm::hash_code hash_value(const ENode& node) {
  using llvm::hash_value;

  return llvm::hash_combine(
      node.data ? hash_value(*node.data) : hash_value(node.data.get()),
      llvm::hash_combine_range(node.operands.begin(), node.operands.end()));
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

void EClass::merge(EClass& eclass) {
  CAFFEINE_ASSERT(this != &eclass);

  bool constant = eclass.is_constant();
  size_t start = nodes.size();

  nodes.insert(nodes.end(), std::move_iterator(eclass.nodes.begin()),
               std::move_iterator(eclass.nodes.end()));
  for (auto it = eclass.parents.begin(); it != eclass.parents.end(); ++it) {
    parents.emplace(it.key(), it.value());
  }

  if (constant) {
    std::swap(nodes.front(), nodes[start]);
  }
}

bool EClass::is_constant() const {
  using Opcode = Operation::Opcode;

  if (nodes.empty())
    return false;

  switch (nodes.front().data->opcode()) {
  case Opcode::ConstantInt:
  case Opcode::ConstantFloat:
    return true;
  default:
    return false;
  }
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
    return &it.value();
  return nullptr;
}
const EClass* EGraph::get(size_t id) const {
  auto it = classes.find(id);
  if (it != classes.end())
    return &it.value();
  return nullptr;
}

size_t EGraph::merge(size_t id1, size_t id2) {
  id1 = find(id1);
  id2 = find(id2);

  if (id1 == id2)
    return id1;

  auto new_id = union_find.do_union(id1, id2);

  classes.at(new_id).merge(classes.at(id2));
  classes.erase(id2);

  if (classes.at(new_id).is_constant())
    unparent(new_id);

  worklist.push_back(new_id);
  return new_id;
}

ENode EGraph::canonicalize(const ENode& node) {
  auto operands = node.operands;
  for (size_t& operand : operands)
    operand = find(operand);

  return ENode{node.data, std::move(operands)};
}

size_t EGraph::add_dirty(const ENode& node) {
  auto canonical = canonicalize(node);
  auto it = hashcons.find(canonical);
  if (it != hashcons.end())
    return it->second;

  auto eclass_id = create_eclass(canonical);
  for (size_t child : canonical.operands) {
    classes.at(child).parents.emplace(canonical, child);
  }

  return eclass_id;
}
size_t EGraph::add_dirty(const Operation& op) {
  if (auto node = llvm::dyn_cast<EGraphNode>(&op))
    return node->id();

  llvm::SmallVector<size_t, 2> operands;
  operands.reserve(op.num_operands());

  for (const auto& operand : op.operands()) {
    operands.push_back(add_dirty(operand));
  }

  return add_dirty(ENode{op.data(), std::move(operands)});
}

size_t EGraph::add(const ENode& node) {
  rebuild();
  return add_dirty(node);
}
size_t EGraph::add(const Operation& op) {
  rebuild();
  return add_dirty(op);
}

void EGraph::rebuild() {
  using std::swap;

  std::vector<size_t> todo;
  while (!worklist.empty()) {
    swap(todo, worklist);

    for (size_t eclass : todo)
      repair(find(eclass));
  }
}

void EGraph::repair(size_t eclass_id) {
  EClass& eclass = classes.at(eclass_id);

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
      merge(p_eclass, it->second);
      it.value() = find(p_eclass);
    } else {
      new_parents.insert({canonical, find(p_eclass)});
    }
  }

  eclass.parents = new_parents;
}

void EGraph::unparent(size_t eclass_id) {
  const EClass& eclass = classes.at(eclass_id);

  for (const ENode& node : eclass.nodes) {
    for (size_t operand : node.operands) {
      EClass& child = classes.at(operand);
      child.parents.erase(node);
    }
  }
}

#define CONST_INT_FOLD(expr)                                                   \
  do {                                                                         \
    if (!operands_are_constant)                                                \
      continue;                                                                \
                                                                               \
    const llvm::APInt& lhs =                                                   \
        llvm::cast<ConstantIntData>(                                           \
            classes.at(node.operands[0]).nodes[0].data.get())                  \
            ->value();                                                         \
    const llvm::APInt& rhs =                                                   \
        llvm::cast<ConstantIntData>(                                           \
            classes.at(node.operands[0]).nodes[0].data.get())                  \
            ->value();                                                         \
                                                                               \
    eclass.nodes.push_back(ENode{std::make_shared<ConstantIntData>(expr)});    \
  } while (false);                                                             \
  break
#define CONST_ICMP_FOLD(expr)                                                  \
  CONST_INT_FOLD([&] {                                                         \
    bool result = expr;                                                        \
    return llvm::APInt(1, (uint64_t)result);                                   \
  }())

void EGraph::constprop() {
  tsl::hopscotch_set<size_t> constants;
  std::deque<size_t> worklist;

  for (auto it = classes.begin(); it != classes.end(); ++it) {
    size_t id = it.key();
    EClass& eclass = it.value();

    if (eclass.is_constant()) {
      // e-classes with a constant value have all their other expressions
      // dropped since a single constant value is the simplest form of the
      // expression.
      unparent(id);
      eclass.nodes.resize(1);

      constants.insert(id);
    } else {
      worklist.push_back(id);
    }
  }

  while (!worklist.empty()) {
    size_t id = worklist.front();
    EClass& eclass = classes.at(id);
    worklist.pop_front();

    if (constants.contains(id))
      continue;

    for (ENode& node : eclass.nodes) {
      bool operands_are_constant = std::all_of(
          node.operands.begin(), node.operands.end(),
          [&](size_t operand) { return constants.contains(operand); });

      switch (node.data->opcode()) {
        // clang-format off
      case Operation::Add:  CONST_INT_FOLD(lhs + rhs);
      case Operation::Sub:  CONST_INT_FOLD(lhs - rhs);
      case Operation::Mul:  CONST_INT_FOLD(lhs * rhs);
      case Operation::UDiv: CONST_INT_FOLD(rhs == 0 ? lhs.udiv(rhs) : rhs);
      case Operation::SDiv: CONST_INT_FOLD(rhs == 0 ? lhs.sdiv(rhs) : rhs);
      case Operation::URem: CONST_INT_FOLD(rhs == 0 ? lhs.urem(rhs) : rhs);
      case Operation::SRem: CONST_INT_FOLD(rhs == 0 ? lhs.srem(rhs) : rhs);

      case Operation::And:  CONST_INT_FOLD(lhs & rhs);
      case Operation::Or:   CONST_INT_FOLD(lhs | rhs);
      case Operation::Xor:  CONST_INT_FOLD(lhs ^ rhs);
      case Operation::Shl:  CONST_INT_FOLD(lhs.shl(rhs));
      case Operation::LShr: CONST_INT_FOLD(lhs.lshr(rhs));
      case Operation::AShr: CONST_INT_FOLD(lhs.ashr(rhs));

      case Operation::ICmpEq:  CONST_ICMP_FOLD(lhs == rhs);
      case Operation::ICmpNe:  CONST_ICMP_FOLD(lhs != rhs);
      case Operation::ICmpUgt: CONST_ICMP_FOLD(lhs.ugt(rhs));
      case Operation::ICmpUge: CONST_ICMP_FOLD(lhs.uge(rhs));
      case Operation::ICmpUlt: CONST_ICMP_FOLD(lhs.ult(rhs));
      case Operation::ICmpUle: CONST_ICMP_FOLD(lhs.ule(rhs));
      case Operation::ICmpSgt: CONST_ICMP_FOLD(lhs.sgt(rhs));
      case Operation::ICmpSge: CONST_ICMP_FOLD(lhs.sge(rhs));
      case Operation::ICmpSlt: CONST_ICMP_FOLD(lhs.slt(rhs));
      case Operation::ICmpSle: CONST_ICMP_FOLD(lhs.sle(rhs));
        // clang-format on

        // TODO: Handle non-binary opcodes

      default:
        continue;
      }

      unparent(id);
      std::swap(eclass.nodes.front(), eclass.nodes.back());
      eclass.nodes.resize(1);
      constants.insert(id);

      for (const auto& [pnode, pclass] : eclass.parents) {
        bool constant = std::all_of(
            pnode.operands.begin(), pnode.operands.end(),
            [&](size_t operand) { return constants.contains(operand); });

        if (constant) {
          worklist.push_back(pclass);
        }
      }

      break;
    }
  }
}

size_t EGraph::create_eclass(const ENode& node) {
  size_t id = union_find.make_set();
  classes.emplace(id, EClass{{node}});
  hashcons.emplace(node, id);
  worklist.push_back(id);
  return id;
}

OpRef EGraph::extract(size_t id) {
  llvm::SmallVector<OpRef, 1> exprs;
  bulk_extract({id}, &exprs);
  return std::move(exprs[0]);
}
OpRef EGraph::extract(size_t id) const {
  llvm::SmallVector<OpRef, 1> exprs;
  bulk_extract({id}, &exprs);
  return std::move(exprs[0]);
}

void EGraph::bulk_extract(llvm::ArrayRef<size_t> ids,
                          llvm::SmallVectorImpl<OpRef>* exprs) {
  rebuild();
  const_cast<const EGraph*>(this)->bulk_extract(ids, exprs);
}
void EGraph::bulk_extract(llvm::ArrayRef<size_t> ids,
                          llvm::SmallVectorImpl<OpRef>* exprs) const {
  auto extractor = EGraphExtractor{this};

  for (size_t id : ids)
    exprs->push_back(extractor.extract(id));
}

EGraphExtractor::EGraphExtractor(const EGraph* graph) : graph(graph) {}

std::pair<uint64_t, size_t> EGraphExtractor::eval_cost(size_t eclass_id) {
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

  const EClass& eclass = graph->classes.at(eclass_id);
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
  costs.insert({eclass_id, {cost, index}});
  return {cost, index};
}
uint64_t EGraphExtractor::eval_cost(const ENode& node) {
  uint64_t cost = eval_cost(node.data->opcode());
  for (size_t operand : node.operands)
    cost += eval_cost(operand).first;
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

OpRef EGraphExtractor::extract(size_t id) {
  id = graph->find(id);
  auto it = expressions.find(id);
  if (it != expressions.end())
    return it->second;

  auto [cost, index] = eval_cost(id);
  const EClass& eclass = graph->classes.at(id);
  const ENode& node = eclass.nodes.at(index);

  llvm::SmallVector<OpRef, 4> operands;
  operands.reserve(node.operands.size());

  for (size_t opid : node.operands)
    operands.push_back(extract(opid));

  OpRef expr = Operation::CreateRaw(node.data, operands);
  expressions.emplace(id, expr);
  return expr;
}

} // namespace caffeine
