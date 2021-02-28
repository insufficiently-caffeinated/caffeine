
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Matching.h"
#include "caffeine/IR/Transforms.h"

namespace caffeine::transforms {

void decompose(std::vector<Assertion>& assertions) {
  using std::swap;
  using namespace matching;

  for (size_t i = 0; i < assertions.size(); ++i) {
    // Keep breaking the expression down until it stops working
    while (true) {
      OpRef lhs, rhs, value;

      // A & B -> A, B
      if (matches(assertions[i], And(lhs, rhs))) {
        *assertions[i].value() = *lhs;
        assertions.push_back(std::move(rhs));
        continue;
      }

      // !(A | B) -> !A, !B
      if (matches(assertions[i], Not(Or(lhs, rhs)))) {
        *assertions[i].value() = *UnaryOp::CreateNot(lhs);
        assertions.push_back(UnaryOp::CreateNot(rhs));
        continue;
      }

      // !!A -> A
      if (matches(assertions[i], Not(Not(value)))) {
        *assertions[i].value() = *value;
        continue;
      }

      break;
    }
  }
}

} // namespace caffeine::transforms
