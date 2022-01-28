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

  friend llvm::hash_code hash_value(const ENode& node);
};

class EClass {
public:
  std::vector<ENode> nodes;
  tsl::hopscotch_map<ENode, size_t> parents = {};

  bool operator==(const EClass& eclass) const;
  bool operator!=(const EClass& eclass) const;

  void merge(EClass& eclass);

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

  const EClass* get(size_t id) const;

  // Merge two e-classes into one. This makes them equivalent and returns the
  // new canonical id.
  size_t merge(size_t id1, size_t id2);

  ENode canonicalize(const ENode& node);

  size_t add(const ENode& node);
  size_t add(const Operation& op);

  void rebuild();

  // Extract an optimal representation for the given expression. This will try
  // to minimize both the size of the generated expression as well as the cost
  // it would involve in a solver.
  OpRef extract(size_t id);
  OpRef extract(size_t id) const;

  // Build expressions for a bunch of e-classes at once. This is more efficient
  // than calling extract for each expression since some internal caches can be
  // reused.
  void bulk_extract(llvm::ArrayRef<size_t> ids,
                    llvm::SmallVectorImpl<OpRef>* exprs);
  void bulk_extract(llvm::ArrayRef<size_t> ids,
                    llvm::SmallVectorImpl<OpRef>* exprs) const;

private:
  // Add without first doing a rebuild.
  size_t add_dirty(const ENode& node);
  size_t add_dirty(const Operation& op);


  void repair(size_t eclass);

  // Remove this eclass from the parent list of all nodes that currently have it
  // as a parent.
  void unparent(size_t eclass);

  size_t create_eclass(const ENode& node);

private:
  UnionFind<size_t> union_find;
  tsl::hopscotch_map<ENode, size_t, LLVMHasher> hashcons;
  tsl::hopscotch_map<size_t, EClass> classes;
  std::vector<size_t> worklist;

  friend class EGraphExtractor;
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

  OpRef extract(size_t eclass);

private:
  std::pair<uint64_t, size_t> eval_cost(size_t eclass_id);
  uint64_t eval_cost(const ENode& node);
  uint64_t eval_cost(Operation::Opcode opcode);

private:
  const EGraph* graph;
  tsl::hopscotch_map<size_t, std::pair<uint64_t, size_t>> costs;
  tsl::hopscotch_map<size_t, OpRef> expressions;
  tsl::hopscotch_set<size_t> visited;
};

} // namespace caffeine

CAFFEINE_DEF_LLVM_HASHER(caffeine::ENode);
CAFFEINE_DEF_LLVM_HASHER(caffeine::EClass);
