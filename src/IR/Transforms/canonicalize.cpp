#include "caffeine/IR/Transforms.h"

#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Visitor.h"
#include <algorithm>
#include <llvm/ADT/SmallVector.h>
#include <unordered_map>
#include <unordered_set>

namespace caffeine::transforms {

void canonicalize(AssertionList& assertions) {
  // The canonical form for an assertion that has a false literal is just an
  // array with a single constant-false assertion.
  if (std::any_of(
          std::begin(assertions), std::end(assertions),
          [](const Assertion& a) { return a.is_constant_value(false); })) {
    assertions.clear();
    assertions.insert(Assertion(ConstantInt::Create(false)));
  }
}

} // namespace caffeine::transforms
