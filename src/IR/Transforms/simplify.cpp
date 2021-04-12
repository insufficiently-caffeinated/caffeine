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

  void replace_all(const Assertion* exception, const Constant* constant,
                   const OpRef& value, AssertionList& assertions,
                   llvm::SmallVectorImpl<Assertion>& output) {
    for (auto it = assertions.begin(); it != assertions.end(); ++it) {
      if (&*it == exception)
        continue;

      auto changed = rebuild(it->value(), [&](const OpRef& op) {
        const auto* cnst = llvm::dyn_cast<Constant>(op.get());
        if (!cnst)
          return op;

        if (cnst->symbol() != constant->symbol())
          return op;

        return value;
      });

      if (changed == it->value())
        continue;

      assertions.erase(it);
      output.push_back(Assertion(changed));
    }
  }
} // namespace

void simplify(AssertionList& assertions) {
  llvm::SmallVector<Assertion, 32> added;

  for (const Assertion& unproven : assertions.unproven()) {
    OpRef constant_, value;
    if (!is_equality_expr(unproven, constant_, value))
      continue;

    const auto* constant = llvm::cast<Constant>(constant_.get());
    replace_all(&unproven, constant, value, assertions, added);
  }

  do {
    size_t index = assertions.backing().backing_size();
    assertions.insert(added);
    added.clear();

    auto range = llvm::iterator_range(assertions.backing().iterator_at(index),
                                      assertions.backing().end());
    for (const Assertion& assertion : range) {
      OpRef constant_, value;
      if (!is_equality_expr(assertion, constant_, value))
        continue;

      const auto* constant = llvm::cast<Constant>(constant_.get());
      replace_all(&assertion, constant, value, assertions, added);
    }
  } while (!added.empty());
}

} // namespace caffeine::transforms
