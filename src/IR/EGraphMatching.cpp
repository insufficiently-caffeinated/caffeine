#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/Operation.h"

namespace caffeine::ematching {

bool SubClauseFilter::operator==(const SubClauseFilter& filter) const {
  if (type != filter.type)
    return false;

  return is_equal(filter);
}
bool SubClauseFilter::operator!=(const SubClauseFilter& filter) const {
  return !(*this == filter);
}

llvm::hash_code hash_value(const SubClauseFilter& filter) {
  return llvm::hash_combine(filter.type, filter.hash());
}

bool SubClause::is_potential_match(const ENode& node) const {
  if (opcode != node.opcode() && opcode != Operation::Invalid)
    return false;

  if (filter && !filter->matches(node))
    return false;
  return true;
}

bool SubClause::operator==(const SubClause& clause) const {
  if (opcode != clause.opcode)
    return false;
  if (submatchers != clause.submatchers)
    return false;
  if (filter != clause.filter)
    return false;
  return true;
}
bool SubClause::operator!=(const SubClause& clause) const {
  return !(*this == clause);
}

llvm::hash_code hash_value(const SubClause& subclause) {
  using llvm::hash_value;

  size_t filter_hash =
      !subclause.filter ? 0 : (size_t)hash_value(*subclause.filter);

  return llvm::hash_combine(subclause.opcode,
                            (llvm::ArrayRef<size_t>)subclause.submatchers,
                            filter_hash);
}

bool MatchData::contains_match(size_t subclause, size_t eclass) const {
  if (subclause >= matches_.size())
    return false;

  return matches_[subclause].find(eclass) != matches_[subclause].end();
}

const MatchData::ClauseData& MatchData::matches(size_t subclause) const {
  return matches_.at(subclause);
}
llvm::ArrayRef<size_t> MatchData::matches(size_t subclause,
                                          size_t eclass) const {
  const auto& cdata = matches_.at(subclause);
  auto it = cdata.find(eclass);
  if (it == cdata.end())
    return {};
  return it->second;
}

GraphAccessor::GraphAccessor(EGraph* egraph, const MatchData* data)
    : egraph(egraph), data(data) {}

void GraphAccessor::persist() {
  for (auto [lhs, rhs] : merges)
    egraph->merge(lhs, rhs);
  merges.clear();
}

size_t GraphAccessor::add(const ENode& enode) {
  return egraph->add(enode);
}
size_t GraphAccessor::add_merge(size_t eclass, const ENode& node) {
  return merge(eclass, add(node));
}

size_t GraphAccessor::add(const OpRef& op) {
  return egraph->add(*op);
}
size_t GraphAccessor::add_merge(size_t eclass, const OpRef& op) {
  return merge(eclass, add(op));
}

size_t GraphAccessor::merge(size_t id1, size_t id2) {
  if (id1 == id2)
    return id1;

  merges.push_back({id1, id2});
  return id1;
}

const EClass* GraphAccessor::get(size_t eclass) const {
  return egraph->get(eclass);
}

OpRef GraphAccessor::get_op(size_t eclass_id) const {
  return EGraphNode::Create(get(eclass_id)->type(), eclass_id);
}

bool GraphAccessor::contains_match(size_t subclause, size_t eclass) const {
  return data->contains_match(subclause, eclass);
}

const MatchData::ClauseData& GraphAccessor::matches(size_t subclause) const {
  return data->matches(subclause);
}
llvm::ArrayRef<size_t> GraphAccessor::matches(size_t subclause,
                                              size_t eclass) const {
  return data->matches(subclause, eclass);
}

EGraph* GraphAccessor::graph() {
  return egraph;
}

size_t EMatcherBuilder::add_clause(Operation::Opcode opcode,
                                   llvm::ArrayRef<size_t> submatchers,
                                   std::unique_ptr<SubClauseFilter>&& filter) {
  for (size_t subclause : submatchers)
    CAFFEINE_ASSERT(subclause < subclause_id);

  SubClause clause{
      opcode, llvm::SmallVector<size_t>(submatchers.begin(), submatchers.end()),
      std::move(filter)};

  auto [it, inserted] = subclauses.emplace(std::move(clause), subclause_id);
  if (!inserted)
    return it->second;

  return subclause_id++;
}

void EMatcherBuilder::add_matcher(size_t clause, EMatcherUpdater update,
                                  std::optional<EMatcherFilter> filter) {
  clauses.push_back(Clause{clause, filter, update});
}

EMatcher EMatcherBuilder::build() {
  EMatcher matcher;

  std::vector<std::pair<size_t, SubClause>> clausetmp;
  clausetmp.reserve(subclauses.size());
  for (auto it = subclauses.begin(); it != subclauses.end(); ++it) {
    clausetmp.emplace_back(it->second,
                           std::move(*const_cast<SubClause*>(&it->first)));
  }

  std::sort(clausetmp.begin(), clausetmp.end(),
            [](const auto& a, const auto& b) { return a.first < b.first; });

  matcher.subclauses.reserve(clausetmp.size());
  for (auto& val : clausetmp)
    matcher.subclauses.push_back(std::move(val.second));

  subclauses.clear();
  subclause_id = 0;

  matcher.clauses = std::move(clauses);

  for (size_t i = 0; i < matcher.subclauses.size(); ++i) {
    const SubClause& clause = matcher.subclauses[i];
    matcher.subindex[clause.opcode].push_back(i);
  }

  return matcher;
}

EMatcherBuilder EMatcher::builder() {
  return EMatcherBuilder();
}

const Clause& EMatcher::clause(size_t clause) const {
  return clauses.at(clause);
}
const SubClause& EMatcher::subclause(size_t subclause) const {
  return subclauses.at(subclause);
}

} // namespace caffeine::ematching
