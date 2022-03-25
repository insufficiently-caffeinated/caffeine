#include "caffeine/Solver/CachingSolver.h"
#include "include/caffeine/Support/LMDB.h"
#include <fmt/format.h>
#include <fmt/ostream.h>

namespace caffeine {

CachingSolver::CachingSolver(const std::shared_ptr<Solver>& solver,
                             const std::shared_ptr<lmdb::env>& env, MDB_dbi dbi)
    : dbi_(dbi), env_(env), solver_(solver) {}

SolverResult CachingSolver::check(AssertionList& assertions,
                                  const Assertion& extra) {
  std::string key = cache_key(assertions, extra);
  lmdb::txn txn = env_->begin_txn(dbi_);

  if (auto val = txn.get(key)) {
    if (val == "SAT")
      return SolverResult::SAT;
    if (val == "UNSAT")
      return SolverResult::UNSAT;
  }
  txn.abort();

  auto result = solver_->check(assertions, extra);
  if (result == SolverResult::Unknown || key.empty())
    return result;

  txn = env_->begin_txn(dbi_);
  txn.put(key, result.kind() == SolverResult::SAT ? "SAT" : "UNSAT");
  txn.commit();

  return result;
}

SolverResult CachingSolver::resolve(AssertionList& assertions,
                                    const Assertion& extra) {
  auto result = solver_->resolve(assertions, extra);
  if (result == SolverResult::Unknown)
    return result;

  std::string key = cache_key(assertions, extra);
  if (key.empty() || key.length() > (size_t)mdb_env_get_maxkeysize(*env_))
    return result;

  lmdb::txn txn = env_->begin_txn(dbi_);
  txn.put(key, result.kind() == SolverResult::SAT ? "SAT" : "UNSAT");
  txn.commit();

  return result;
}

void CachingSolver::interrupt() {
  solver_->interrupt();
}

std::string CachingSolver::cache_key(AssertionList& assertions,
                                     const Assertion& extra) {
  std::vector<std::string> exprs;

  for (const auto& assertion : assertions) {
    exprs.push_back(fmt::format(FMT_STRING("{}"), assertion));
  }

  if (!extra.is_constant_value(true))
    exprs.push_back(fmt::format(FMT_STRING("{}"), extra));

  std::sort(exprs.begin(), exprs.end());
  return fmt::format("{}", fmt::join(exprs, "\n"));
}

CachingSolverBuilder::CachingSolverBuilder(const char* path, unsigned flags)
    : env_(std::make_shared<lmdb::env>(path, flags)) {
  dbi_ = env_->open_db("caffeine-cache", MDB_CREATE);
}

std::shared_ptr<Solver>
CachingSolverBuilder::operator()(const std::shared_ptr<Solver>& solver) const {
  return std::make_shared<CachingSolver>(solver, env_, dbi_);
}

} // namespace caffeine
