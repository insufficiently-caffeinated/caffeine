#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Matching.h"
#include "caffeine/IR/Transforms.h"

namespace caffeine::transforms {
namespace m = caffeine::matching;

namespace {

  bool is_equality_expr(const Assertion& assertion, ref<Operation>& constant,
                        ref<Operation>& value) {
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

void simplify(std::vector<Assertion>& assertions) {

  decompose(assertions);

  for (size_t i = 0; i < assertions.size(); ++i) {
    ref<Operation> constant_, value;
    if (!is_equality_expr(assertions[i], constant_, value))
      continue;

    const auto* constant = llvm::cast<Constant>(constant_.get());

    for (size_t j = 0; j < assertions.size(); ++j) {
      if (j == i)
        continue;

      auto changed =
          rebuild(assertions[i].value(), [&](const ref<Operation>& op) {
            const auto* cnst = llvm::dyn_cast<Constant>(op.get());
            if (!cnst)
              return op;

            if (cnst->symbol() != constant->symbol())
              return op;

            return value;
          });

      assertions[i].value() = changed;
    }
  }
}

} // namespace caffeine::transforms
