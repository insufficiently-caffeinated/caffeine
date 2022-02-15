#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/OperationBase.h"
#include <boost/range/combine.hpp>
#include <boost/range/join.hpp>
#include <fmt/format.h>
#include <magic_enum.hpp>
#include <tsl/hopscotch_map.h>
#include <unordered_map>

namespace caffeine {

using namespace ematching;

class EGraphMatcher {
public:
  struct WorkItem {
    size_t clause;
    size_t eclass;
    size_t enode;
  };

  const EMatcher* matcher;
  EGraph* egraph;

  // Map of clause -> eclass -> node index
  std::unordered_map<size_t, std::unordered_multimap<size_t, size_t>>
      potentials = {};
  // Map of eclass -> clause
  // Used to remove matches from an updated clause
  std::unordered_map<size_t, std::vector<size_t>> reversed = {};

public:
  void equality_saturation() {
    egraph->constprop();
    egraph->rebuild();

    while (!egraph->updated.empty()) {
      update_potential_matches();
      auto data = find_matches();
      auto work = matching_work_items(data);

      egraph->updated.clear();

      GraphAccessor accessor(egraph, &data);

      for (auto [clause_id, eclass_id, enode_id] : work) {
        const auto& clause = matcher->clauses[clause_id];
        clause.update(accessor, eclass_id, enode_id);
      }

      accessor.persist();

      egraph->constprop();
      egraph->rebuild();
    }
  }

  // Methods for setting up potential matches
  // ========================================

  // Build the initial set of potential matches for the given e-class.
  void update_eclass_potential_matches(size_t eclass_id) {
    const EClass& eclass = *egraph->get(eclass_id);

    for (size_t clause_id : reversed[eclass_id]) {
      potentials[clause_id].erase(eclass_id);
    }

    // Don't calculate any potential matches for e-classes which have expired.
    if (egraph->find(eclass_id) != eclass_id)
      return;

    for (size_t node_id = 0; node_id < eclass.nodes.size(); ++node_id) {
      const ENode& node = eclass.nodes[node_id];

      for (size_t clause_id :
           boost::range::join(matching_clauses(Operation::Invalid),
                              matching_clauses(node.opcode()))) {
        const EMatchSubClause& clause = matcher->subclauses[clause_id];

        if (clause.is_potential_match(node)) {
          potentials[clause_id].emplace(eclass_id, node_id);
          reversed[eclass_id].push_back(clause_id);
        }
      }
    }
  }

  void update_potential_matches() {
    if (potentials.empty()) {
      for (const auto& [eclass, _] : egraph->classes)
        update_eclass_potential_matches(eclass);
    } else {
      for (size_t eclass : egraph->updated)
        update_eclass_potential_matches(eclass);
    }
  }

  // Find all matching subclauses and build an EMatcherData structure for them.
  EMatcherData find_matches() {
    MatchData::MapData matches;
    matches.reserve(matcher->clauses.size());

    for (size_t clause_id = 0; clause_id < matcher->subclauses.size();
         ++clause_id) {
      MatchData::ClauseData clause_matches;

      auto pit = potentials.find(clause_id);
      if (pit == potentials.end()) {
        matches.push_back(std::move(clause_matches));
        continue;
      }

      const auto& clause = matcher->subclauses[clause_id];
      const auto& potentials = pit->second;

      for (const auto& [eclass_id, enode_id] : potentials) {
        const EClass& eclass = *egraph->get(eclass_id);
        const ENode& enode = eclass.nodes.at(enode_id);

        if (!clause.submatchers.empty()) {
          if (clause.submatchers.size() != enode.operands.size())
            continue;

          for (auto value :
               boost::range::combine(clause.submatchers, enode.operands)) {
            auto subclause = boost::get<0>(value);
            auto operand = boost::get<1>(value);

            if (matches.size() <= subclause)
              goto do_continue;

            const auto& submatches = matches.at(subclause);
            if (submatches.find(operand) == submatches.end())
              goto do_continue;
          }
        }

        clause_matches[eclass_id].push_back(enode_id);

      do_continue:
        continue;
      }

      matches.push_back(std::move(clause_matches));
    }

    return EMatcherData(std::move(matches));
  }

  // Find all matching top-level matchers. All this does is filter out matches
  // that don't satisfy the filter function.
  std::vector<WorkItem> matching_work_items(const EMatcherData& data) {
    std::vector<WorkItem> top_level;
    GraphAccessor accessor{egraph, &data};

    for (size_t clause_id = 0; clause_id < matcher->clauses.size();
         ++clause_id) {
      const EMatchClause& clause = matcher->clauses[clause_id];
      const EMatchSubClause& subclause = matcher->subclauses[clause.matcher];

      const auto& matches = data.matches(clause.matcher);
      for (const auto& [eclass_id, enodes] : matches) {
        if (egraph->find(eclass_id) != eclass_id)
          continue;
        if (!egraph->updated.contains(eclass_id))
          continue;

        for (size_t enode_id : enodes) {
          const EClass* eclass = egraph->get(eclass_id);
          const ENode& enode = eclass->nodes[enode_id];

          if (subclause.opcode != Operation::Invalid) {
            CAFFEINE_ASSERT(
                enode.opcode() == subclause.opcode,
                fmt::format("{} != {}", Operation::opcode_name(enode.opcode()),
                            Operation::opcode_name(subclause.opcode)));
          }

          if (clause.filter.has_value() && !(*clause.filter)(accessor, enode))
            continue;

          top_level.push_back({clause_id, eclass_id, enode_id});
        }
      }
    }

    return top_level;
  }

  llvm::ArrayRef<size_t> matching_clauses(Operation::Opcode opcode) const {
    auto it = matcher->subindex.find(opcode);
    if (it == matcher->subindex.end())
      return {};
    return it->second;
  }
};

void EGraph::simplify(const EMatcher& matcher) {
  EGraphMatcher g{&matcher, this};
  g.equality_saturation();
}

} // namespace caffeine
