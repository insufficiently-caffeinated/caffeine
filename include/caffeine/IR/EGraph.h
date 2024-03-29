#pragma once

#include "caffeine/ADT/UnionFind.h"
#include "caffeine/IR/OperationBase.h"
#include "caffeine/Support/Hashing.h"
#include <tsl/hopscotch_map.h>
#include <tsl/hopscotch_set.h>

namespace caffeine {
class ENode;
class EClass;
class Operation;

namespace ematching {
  class EMatcher;
}
} // namespace caffeine

CAFFEINE_DECL_LLVM_HASHER(caffeine::ENode);
CAFFEINE_DECL_LLVM_HASHER(caffeine::EClass);

namespace caffeine {

class ENode {
public:
  std::shared_ptr<OperationData> data;
  llvm::SmallVector<size_t, 2> operands = {};

  bool operator==(const ENode& node) const;
  bool operator!=(const ENode& node) const;

  Type type() const;
  Operation::Opcode opcode() const;
  bool is_constant() const;

  friend llvm::hash_code hash_value(const ENode& node);
};

struct EClassCost {
  uint64_t cost;
  size_t index;
};

class EClassCache {
public:
  OpRef expr;
  std::optional<EClassCost> cost;

  EClassCache() = default;

  void clear();
};

class EClass {
public:
  std::vector<ENode> nodes;
  tsl::hopscotch_map<ENode, size_t> parents;
  EClassCache cache;
  // Gives the index of the constant value
  std::optional<size_t> constant_index = std::nullopt;

  EClass(std::vector<ENode>&& nodes);

  bool operator==(const EClass& eclass) const;
  bool operator!=(const EClass& eclass) const;

  void merge(EClass&& eclass);

  bool is_constant() const;
  Type type() const;

  ENode* constant();
  const ENode* constant() const;

  friend llvm::hash_code hash_value(const EClass& node);
};

/**
 * An implementation of an E-Graph as described in the egg paper.
 *
 * An e-graph is an efficient representation of a number of syntax trees that
 * will deduplicate them according to all the equality rules that have been
 * applied. It does this by mapping every expression it has seen to an e-class
 * (a.k.a. equivalence class). Expressions start off in an e-class that only
 * contains themselves but as rewrites are applied equivalent e-classes are
 * merged together.
 *
 * This implementation is based off of the one described in
 * https://arxiv.org/pdf/2004.03082.pdf.
 *
 * The one difference that this implementation makes from the overall
 * representation in the paper is that e-classes that have a constant value will
 * have all their other stored representations dropped. This doesn't mean that
 * equivalent forms being inserted from being mapped to that e-class, but it
 * does prevent any additional simplifications from being made to a node that is
 * already constant.
 */
class EGraph {
public:
  /**
   * Canonicalize an eclass id.
   */
  size_t find(size_t id) const;
  size_t find(size_t id);

  EClass* get(size_t id);
  const EClass* get(size_t id) const;

  // Merge two e-classes into one. This makes them equivalent and returns the
  // new canonical id.
  size_t merge(size_t id1, size_t id2);

  ENode canonicalize(const ENode& node);

  size_t add(const ENode& node);
  size_t add(const Operation& op);

  size_t add_merge(size_t eclass, const ENode& node);

  // Checks whether the e-node is contained within the graph, and, if so,
  // returns the corresponding e-class.
  //
  // The passed-in enode must be in canonical form.
  std::optional<size_t> classof(const ENode& node) const;

  void rebuild();

  // Extract an optimal representation for the given expression. This will try
  // to minimize both the size of the generated expression as well as the cost
  // it would involve in a solver.
  //
  // Note that if you are going to perform lots of extractions without modifying
  // the e-graph then it is preferable to use EGraphExtractor instead.
  OpRef extract(size_t id);
  OpRef extract(size_t id) const;

  // Extract an optimal represent for an expression that contains references to
  // egraph nodes. This will return the same expression with all instances of
  // EGraphNode replaced with their corresponding minimal expression.
  //
  // It is preferrable to use this method instead of first adding the expression
  // and then extracting it from the resulting eclass id as this will help
  // minimize the e-graph.
  OpRef extract(const Operation& op);
  OpRef extract(const Operation& op) const;

  // Simplify the e-graph using all the rewrite rules within matcher.
  //
  // The implementation of the e-graph assumes that it keep being called
  // repeatedly with the same EMatcher instance. Calling it with different
  // EMatcher instances will likely result in some rewrites being missed.
  void simplify(const ematching::EMatcher& matcher);

  void constprop();

  std::string DebugString() const;
  void DebugPrint() const;

private:
  void repair(size_t eclass);

  // Remove this eclass from the parent list of all nodes that currently have it
  // as a parent.
  void unparent(size_t eclass);

  size_t create_eclass(const ENode& node);

private:
  UnionFind<size_t> union_find;
  tsl::hopscotch_map<ENode, size_t, LLVMHasher> hashcons;
  std::unordered_map<size_t, EClass> classes;
  tsl::hopscotch_set<size_t> updated;
  std::vector<size_t> worklist;

  friend class EGraphMatcher;
  friend class EGraphExtractor;
  friend class EGraphConstantPropagator;
};

/**
 * A stateful extractor for expressions contained within an E-Graph.
 *
 * Actually building the expressions involves a bunch of caching of intermediate
 * expressions so the more extractions that can be done while reusing the same
 * extractor the faster things will be.
 */
class EGraphExtractor {
public:
  EGraphExtractor(const EGraph* egraph);
  EGraphExtractor(EGraph* egraph);

  OpRef extract(size_t eclass);
  OpRef extract(const Operation& expr);

  // Update the cached costs for the eclass and all those it depends upon.
  void update_cost(size_t eclass_id);

private:
  EClassCost eval_cost(size_t eclass_id);
  uint64_t eval_cost(const ENode& node);
  uint64_t eval_cost(Operation::Opcode opcode);

  void update_cached(size_t eclass, const OpRef& expr);
  void update_cached(size_t eclass, EClassCost cost);

private:
  const EGraph* graph;
  bool is_const;
  tsl::hopscotch_map<size_t, EClassCost> costs;
  tsl::hopscotch_map<size_t, OpRef> expressions;
  tsl::hopscotch_set<size_t> visited;
};

} // namespace caffeine

CAFFEINE_DEF_LLVM_HASHER(caffeine::ENode);
CAFFEINE_DEF_LLVM_HASHER(caffeine::EClass);
