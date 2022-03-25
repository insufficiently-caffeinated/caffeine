#pragma once

#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/LMDB.h"
#include <exception>

namespace caffeine {

class CachingSolver : public Solver {
public:
  CachingSolver(const std::shared_ptr<Solver>& solver,
                const std::shared_ptr<lmdb::env>& env, MDB_dbi dbi);

  SolverResult check(AssertionList& assertions,
                     const Assertion& extra) override;
  SolverResult resolve(AssertionList& assertions,
                       const Assertion& extra) override;

  void interrupt() override;

private:
  std::string cache_key(AssertionList& assertions, const Assertion& extra);

private:
  MDB_dbi dbi_;
  std::shared_ptr<lmdb::env> env_;
  std::shared_ptr<Solver> solver_;
};

class CachingSolverBuilder {
public:
  CachingSolverBuilder(const char* path, unsigned flags = 0);

  std::shared_ptr<Solver>
  operator()(const std::shared_ptr<Solver>& solver) const;

private:
  std::shared_ptr<lmdb::env> env_;
  MDB_dbi dbi_;
};

} // namespace caffeine
