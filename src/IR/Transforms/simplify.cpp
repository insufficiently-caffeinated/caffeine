#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Matching.h"
#include "caffeine/IR/Transforms.h"

namespace caffeine::transforms {
namespace m = caffeine::matching;

namespace {

  bool is_equality_expr(const Assertion& assertion, OpRef& constant,
                        OpRef& value) {
    using namespace caffeine::matching;

    if (matches(assertion, ICmpEq(Capture(constant, m::Constant()),
                                  Capture(value, m::ConstantInt())))) {
      return true;
    }

    if (matches(assertion, ICmpEq(Capture(value, m::ConstantInt()),
                                  Capture(constant, m::Constant())))) {
      return true;
    }

    return false;
  }

} // namespace

void simplify(AssertionList& assertions) {
  llvm::SmallVector<Assertion, 32> new_unproven;
  llvm::SmallVector<Assertion, 32> new_proven;
  llvm::SmallVector<size_t, 32> removed;

  for (const Assertion& unproven : assertions.unproven()) {
    OpRef constant_, value;
    if (!is_equality_expr(unproven, constant_, value))
      continue;

    const auto* constant = llvm::cast<Constant>(constant_.get());

    size_t count = 0;

    for (const Assertion& a : assertions) {
      if (a == unproven)
        continue;

      auto changed = rebuild(a.value(), [&](const OpRef& op) {
        const auto* cnst = llvm::dyn_cast<Constant>(op.get());
        if (!cnst)
          return op;

        if (cnst->symbol() != constant->symbol())
          return op;

        return value;
      });

      if (changed == a.value())
        continue;

      if (count > assertions.proven().size()) {
        new_proven.push_back(changed);
      } else {
        new_unproven.push_back(changed);
      }

      removed.push_back(count);
      count += 1;
    }
  }

  for (size_t rem : removed) {
    assertions.erase(&assertions[rem]);
  }

  for (const auto& new_u : new_unproven) {
    assertions.insert(new_u, AssertionList::Unproven);
  }
  for (const auto& new_p : new_proven) {
    assertions.insert(new_p, AssertionList::Proven);
  }
}

} // namespace caffeine::transforms
