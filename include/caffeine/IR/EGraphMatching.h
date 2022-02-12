#pragma once

#include "caffeine/IR/OperationBase.h"
#include <functional>

namespace caffeine {

namespace ematching {
  class GraphAccessor;
}

class ENode;
class EGraph;

using EMatcherFilter = std::function<bool(
    const ematching::GraphAccessor& egraph, const ENode& node)>;
using EMatcherUpdater = std::function<void(ematching::GraphAccessor& egraph,
                                           size_t eclass, size_t node_index)>;

namespace ematching {

  // A custom filter for a subclause for any other conditions beyond filtering
  // based on opcode.
  //
  // This class needs to be hashable and comparable so it's also necessary for
  // any derived class to implement the hash and is_equal virtual methods,
  // respectively. The implementation in the parent class will ensure that
  // is_equal is only called when the types are equal.
  class SubClauseFilter {
  public:
    // Check whether the passed-in ENode is a valid match. If this returns false
    // then the node will not be considered as a match for this sub-clause.
    virtual bool matches(const ENode& node) const = 0;

    bool operator==(const SubClauseFilter& filter) const;
    bool operator!=(const SubClauseFilter& filter) const;

    virtual ~SubClauseFilter() = default;

  protected:
    SubClauseFilter(const void* type) : type(type) {}

  private:
    // Compare whether this class is equal to the derived one.
    //
    // This will only be called if the other class has the same type as this
    // one.
    virtual bool is_equal(const SubClauseFilter& other) const = 0;
    virtual size_t hash() const = 0;

    friend llvm::hash_code hash_value(const SubClauseFilter& filter);

  private:
    const void* type;
  };

  class SubClause {
  public:
    // Note: If this is Operation::Invalid then this will match against any
    //       possible opcode.
    Operation::Opcode opcode;

    // If this is empty, then it will match against any set of operands,
    // otherwise it needs to be the same number of operands and all sub-matchers
    // must match.
    llvm::SmallVector<size_t> submatchers;

    // A filter that only checks the current enode and doesn't look at larger
    // graph structure.
    //
    // This is a function pointer so that subclauses can be deduplicated.
    std::unique_ptr<SubClauseFilter> filter = nullptr;

  public:
    bool is_potential_match(const ENode& node) const;

    bool operator==(const SubClause& clause) const;
    bool operator!=(const SubClause& clause) const;

    friend llvm::hash_code hash_value(const SubClause& subclause);
  };

  class Clause {
  public:
    // ID for the top-level submatcher for this clause.
    size_t matcher;

    // Function to perform non-structural filtering.
    std::optional<EMatcherFilter> filter;
    // Function to actually do the updates once this clause is matched.
    EMatcherUpdater update;
  };

} // namespace ematching

} // namespace caffeine
