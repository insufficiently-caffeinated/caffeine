#include "caffeine/Solver/CanonicalizingSolver.h"

#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"

#include <llvm/ADT/SmallVector.h>

#include <unordered_set>

namespace caffeine {

using ReferenceMap = std::unordered_map<Operation, ref<Operation>>;

static ref<Operation> canonicalize(const ref<Operation>& op,
                                   ReferenceMap& seen);

static ref<Operation> canonicalize_(const ref<Operation>& op,
                                    ReferenceMap& seen) {
  if (auto* array = llvm::dyn_cast<FixedArray>(op.get())) {
    auto data = array->data();
    bool set_any = false;

    for (size_t i = 0; i < data.size(); ++i) {
      auto elem = data[i];
      auto rel = canonicalize(elem, seen);

      if (rel != elem) {
        data.set(i, std::move(rel));
        set_any = true;
      }
    }

    if (!set_any)
      return op;
    return FixedArray::Create(Type::int_ty(op->type().bitwidth()), data);
  } else {
    llvm::SmallVector<ref<Operation>, 3> operands;

    size_t nops = op->num_operands();
    for (size_t i = 0; i < nops; ++i) {
      operands.push_back(canonicalize(op->operand_at(i), seen));
    }

    return op->with_new_operands(operands);
  }
}

static ref<Operation> canonicalize(const ref<Operation>& op,
                                   ReferenceMap& seen) {
  auto it = seen.find(*op);
  if (it != seen.end())
    return it->second;

  auto res = canonicalize_(op, seen);
  seen.emplace(*op, res);
  return res;
}

void CanonicalizingSolver::canonicalize_all(
    std::vector<Assertion>& assertions) {
  std::unordered_set<Operation*> known_assertions;
  ReferenceMap seen;

  auto it = std::remove_if(
      assertions.begin(), assertions.end(), [&](Assertion& assertion) {
        assertion.value() = canonicalize(assertion.value(), seen);
        return !known_assertions.insert(assertion.value().get()).second;
      });
  assertions.erase(it, assertions.end());
}

SolverResult CanonicalizingSolver::check(std::vector<Assertion>& assertions,
                                         const Assertion&) {
  canonicalize_all(assertions);
  return SolverResult::Unknown;
}
std::unique_ptr<Model>
CanonicalizingSolver::resolve(std::vector<Assertion>& assertions,
                              const Assertion&) {
  canonicalize_all(assertions);
  return std::make_unique<EmptyModel>(SolverResult::Unknown);
}

} // namespace caffeine
