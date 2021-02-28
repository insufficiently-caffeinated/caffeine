#include "caffeine/IR/Transforms.h"

#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Visitor.h"
#include <algorithm>
#include <llvm/ADT/SmallVector.h>
#include <unordered_map>
#include <unordered_set>

namespace caffeine::transforms {

namespace {
  using ReferenceMap = std::unordered_map<Operation, OpRef>;

  class CanonicalizeVisitor
      : public ConstOpVisitor<CanonicalizeVisitor, OpRef> {
    ReferenceMap seen;

  public:
    OpRef visit(const Operation* op) {
      return visit(*op);
    }
    OpRef visit(const Operation& op) {
      auto it = seen.find(op);
      if (it != seen.end())
        return it->second;

      auto res = ConstOpVisitor<CanonicalizeVisitor, OpRef>::visit(op);
      seen.emplace(op, res);
      return res;
    }

    OpRef visitOperation(const Operation& op) {
      llvm::SmallVector<OpRef, 3> operands;

      for (auto& operand : op.operands()) {
        operands.push_back(visit(operand));
      }

      return op.with_new_operands(operands);
    }

    OpRef visitFixedArray(const FixedArray& array) {
      auto data = array.data();
      bool set_any = false;

      for (size_t i = 0; i < data.size(); ++i) {
        OpRef elem = data[i];
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

void canonicalize(std::vector<Assertion>& assertions) {
  std::unordered_set<Operation*> known;
  CanonicalizeVisitor visitor;

  auto it = std::remove_if(
      std::begin(assertions), std::end(assertions), [&](Assertion& assertion) {
        assertion.value() = visitor.visit(assertion.value().get());
        return !known.insert(assertion.value().get()).second ||
               assertion.is_constant_value(true);
      });
  assertions.erase(it, assertions.end());

  // The canonical form for an assertion that has a false literal is just an
  // array with a single constant-false assertion.
  if (std::any_of(
          std::begin(assertions), std::end(assertions),
          [](const Assertion& a) { return a.is_constant_value(false); })) {
    assertions.clear();
    assertions.push_back(Assertion(ConstantInt::Create(false)));
  }
}

} // namespace caffeine::transforms
