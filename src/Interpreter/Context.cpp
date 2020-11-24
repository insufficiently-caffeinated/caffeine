#include "caffeine/Interpreter/Context.h"

namespace caffeine {

Context::Context(const std::shared_ptr<Solver>& solver, llvm::Function* func) : solver{solver} {

}

Context Context::fork() const {
  return Context{*this};
}

}