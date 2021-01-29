#include "caffeine/Solver/CanonicalizingSolver.h"

#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Visitor.h"

#include <llvm/ADT/SmallVector.h>

#include <unordered_set>

namespace caffeine {

using ReferenceMap = std::unordered_map<Operation, ref<Operation>>;

namespace {
  class CanonicalizeVisitor
      : public ConstOpVisitor<CanonicalizeVisitor, ref<Operation>> {
    ReferenceMap seen;

  public:
    ref<Operation> visit(const Operation* op) {
      return visit(*op);
    }
    ref<Operation> visit(const Operation& op) {
      auto it = seen.find(op);
      if (it != seen.end())
        return it->second;

      auto res = ConstOpVisitor<CanonicalizeVisitor, ref<Operation>>::visit(op);
      seen.emplace(op, res);
      return res;
    }

    ref<Operation> visitOperation(const Operation& op) {
      llvm::SmallVector<ref<Operation>, 3> operands;

      for (auto& operand : op.operands()) {
        operands.push_back(visit(operand));
      }

      return op.with_new_operands(operands);
    }

    ref<Operation> visitFixedArray(const FixedArray& array) {
      auto data = array.data();
      bool set_any = false;

      for (size_t i = 0; i < data.size(); ++i) {
        ref<Operation> elem = data[i];
        auto rel = visit(*elem);

        if (rel != elem) {
          data.set(i, std::move(rel));
          set_any = true;
        }
      }

      if (!set_any)
        return array.into_ref();

      return FixedArray::Create(Type::int_ty(array.type().bitwidth()), data);
    }
  };
} // namespace

void CanonicalizingSolver::canonicalize_all(
    std::vector<Assertion>& assertions) {
  std::unordered_set<Operation*> known_assertions;
  CanonicalizeVisitor visitor;

  auto it = std::remove_if(
      assertions.begin(), assertions.end(), [&](Assertion& assertion) {
        assertion.value() = visitor.visit(assertion.value().get());
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
