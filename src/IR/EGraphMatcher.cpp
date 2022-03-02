#include "caffeine/ADT/FunctionView.h"
#include "caffeine/ADT/Guard.h"
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

  // Map containing all subclauses that are captured.
  std::unordered_map<size_t, const ENode*> captures = {};

public:
  void equality_saturation() {
    egraph->constprop();
    egraph->rebuild();

    while (!egraph->updated.empty()) {
      update_potential_matches();
      auto data = find_matches();
      auto work = matching_work_items(data);

      egraph->updated.clear();

      GraphAccessor accessor(egraph, &data, &captures);

      for (auto [clause_id, eclass_id, enode_id] : work) {
        const auto& clause = matcher->clauses[clause_id];

        all_captures(clause.matcher, eclass_id, enode_id, data,
                     [&, eclass_id = eclass_id, enode_id = enode_id] {
                       clause.update(accessor, eclass_id, enode_id);
                     });
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

  // Iterate through all combinations of captures and, for each one, call the
  // provided function once the captures map has all the required types.
  //
  // Note that the initial subclause is always considered to be a capture, even
  // if it is not meant to be since at this phase we've already eliminated it
  // down to 1 match.
  void all_captures(size_t subclause_id, size_t eclass_id, size_t enode_id,
                    const EMatcherData& data, function_view<void()> func) {
    const EClass* eclass = egraph->get(eclass_id);
    const ENode* enode = &eclass->nodes.at(enode_id);
    const SubClause& subclause = matcher->subclause(subclause_id);

    captures.emplace(subclause_id, enode);
    auto guard = make_guard([&] { captures.clear(); });

    if (!matcher->captures.at(subclause_id)) {
      func();
      return;
    }

    auto iterate = [&](size_t index, const auto& func, const auto& iterate) {
      if (index >= subclause.submatchers.size()) {
        func();
        return;
      }

      size_t submatcher = subclause.submatchers[index];
      size_t operand = enode->operands[index];

      all_captures_impl(submatcher, operand, data,
                        [&] { iterate(index + 1, func, iterate); });
    };

    iterate(0, func, iterate);
  }

  void all_captures_impl(size_t subclause_id, size_t eclass_id,
                         const EMatcherData& data, function_view<void()> func) {
    if (!matcher->captures[subclause_id]) {
      func();
      return;
    }

    const SubClause& subclause = matcher->subclause(subclause_id);
    const EClass* eclass = egraph->get(eclass_id);

    auto matches = data.matches(subclause_id, eclass_id);
    auto guard = make_guard([&] { captures.erase(subclause_id); });

    for (size_t node_id : matches) {
      const ENode* node = &eclass->nodes.at(node_id);

      if (subclause.is_capture)
        captures[subclause_id] = node;

      auto iterate = [&](size_t index, const auto& func, const auto& iterate) {
        if (index >= subclause.submatchers.size()) {
          func();
          return;
        }

        size_t submatcher = subclause.submatchers[index];
        size_t operand = node->operands[index];

        all_captures_impl(submatcher, operand, data,
                          [&] { iterate(index + 1, func, iterate); });
      };

      iterate(0, func, iterate);
    }
  }
};

void EGraph::simplify(const EMatcher& matcher) {
  EGraphMatcher g{&matcher, this};
  g.equality_saturation();
}

} // namespace caffeine
