#pragma once

#include "caffeine/IR/OperationBase.h"
#include "caffeine/Support/Hashing.h"
#include <functional>
#include <optional>
#include <unordered_map>
#include <vector>

namespace caffeine {

namespace ematching {
  class EMatcher;
  class GraphAccessor;
} // namespace ematching

class ENode;
class EClass;
class EGraph;
class EGraphMatcher;

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

  class MatchData {
  public:
    using ClauseData = std::unordered_map<size_t, std::vector<size_t>>;
    using MapData = std::vector<ClauseData>;

  private:
    // Map of subclause -> eclass -> node index
    MapData matches_;

  public:
    MatchData(MapData&& matches) : matches_(std::move(matches)) {}

    bool contains_match(size_t subclause, size_t eclass) const;

    const ClauseData& matches(size_t subclause) const;
    llvm::ArrayRef<size_t> matches(size_t subclause, size_t eclass) const;
  };

  // Wrapper around EGraph and MatchData that only allows changes that will not
  // invalidate the indices of elements within the e-graph.
  //
  // Basically, it allows you to inspect the e-graph and add new e-classes to
  // it, but will delay merges until all current rewrite rules have been
  // applied.
  class GraphAccessor {
  public:
    GraphAccessor(EGraph* egraph, const MatchData* data);

    // Create a new e-class with the given e-node.
    size_t add(const ENode& enode);
    size_t add_merge(size_t eclass, const ENode& enode);

    size_t add(const OpRef& op);
    size_t add_merge(size_t eclass, const OpRef& op);

    // Merge two e-classes together.
    //
    // The actual act of merging is delayed until all e-graph updates have gone
    // through.
    size_t merge(size_t id1, size_t id2);

    const EClass* get(size_t eclass) const;
    OpRef get_op(size_t eclass) const;

    bool contains_match(size_t subclause, size_t eclass) const;

    const MatchData::ClauseData& matches(size_t subclause) const;
    llvm::ArrayRef<size_t> matches(size_t subclause, size_t eclass) const;

    EGraph* graph();

    GraphAccessor(const GraphAccessor&) = delete;
    GraphAccessor(GraphAccessor&&) = delete;

    GraphAccessor& operator=(const GraphAccessor&) = delete;
    GraphAccessor& operator=(GraphAccessor&&) = delete;

  private:
    // Actually write out the changes to the underlying e-graph.
    //
    // If this method is not called then no changes will be made to the e-graph.
    void persist();

  private:
    EGraph* egraph;
    const MatchData* data;

    std::vector<std::pair<size_t, size_t>> merges;

    friend class caffeine::EGraphMatcher;
  };

  class EMatcherBuilder {
  public:
    EMatcherBuilder() = default;

    // Add a clause that matches any expression.
    size_t add_any() {
      return add_clause(Operation::Invalid);
    }

    size_t add_clause(Operation::Opcode opcode,
                      llvm::ArrayRef<size_t> submatchers = {},
                      std::unique_ptr<SubClauseFilter>&& filters = nullptr);

    void add_matcher(size_t clause, EMatcherUpdater update,
                     std::optional<EMatcherFilter> filter = std::nullopt);

    void add_defaults();

    EMatcher build();

  private:
    size_t subclause_id = 0;

    std::vector<Clause> clauses;
    std::unordered_map<SubClause, size_t, LLVMHasher> subclauses;
  };

  namespace reductions {
    // (#binop ?x ?y) -> (#binop ?y ?x)
    void commutativity(EMatcherBuilder& builder);
    void commutativity(EMatcherBuilder& builder, Operation::Opcode opcode);

    // (#op ?x (#op ?y ?z)) -> (#op (#op ?x ?y) ?z)
    void associativity(EMatcherBuilder& builder);
    void associativity(EMatcherBuilder& builder, Operation::Opcode opcode);

    // (sub ?x ?x) -> (ixx 0)
    void sub_elimination(EMatcherBuilder& builder);

    // (and ?x ?x) -> ?x
    void and_elimination(EMatcherBuilder& builder);

    // (or ?x ?x) -> ?x
    void or_elimination(EMatcherBuilder& builder);

    // (xor ?x ?x) -> (ixx 0)
    void xor_elimination(EMatcherBuilder& builder);

    // (and ?x 0) -> (ixx 0)
    void and_zero_elimination(EMatcherBuilder& builder);

    // (icmp.## ?x ?x) -> true or false
    void icmp_eliminations(EMatcherBuilder& builder);
  } // namespace reductions

  class EMatcher {
  public:
    static EMatcherBuilder builder();

  private:
    std::vector<Clause> clauses;
    std::vector<SubClause> subclauses;

    std::unordered_map<Operation::Opcode, std::vector<size_t>> subindex;

    friend class EMatcherBuilder;
    friend class caffeine::EGraphMatcher;
  };

} // namespace ematching

using EMatchSubClause = ematching::SubClause;
using EMatchClause = ematching::Clause;
using EMatcherData = ematching::MatchData;
using EMatcher = ematching::EMatcher;

} // namespace caffeine
