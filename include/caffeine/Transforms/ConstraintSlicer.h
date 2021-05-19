#pragma once

#include "caffeine/ADT/WeakMap.h"
#include "caffeine/IR/Operation.h"
#include <llvm/ADT/SmallVector.h>
#include <memory>
#include <unordered_set>

namespace caffeine {
class Assertion;
class AssertionList;

/**
 * Utility class to extract only the assertions required to prove the unproven
 * assertions in a provided list of assertions.
 *
 * The main method that you'll want to call in this class is the slice method
 * which works as specified above.
 *
 * This class also stores a cache of previously seen operations and the symbols
 * contained within those operations.
 *
 * The algorithm implemented here is described in "Green: reducing, reusing and
 * recycling constraints in program analysis" by Visser et Al.
 * (https://doi.org/10.1145/2393596.2393665).
 */
class ConstraintSlicer {
private:
  weak_map<const Operation, llvm::SmallVector<Symbol, 4>> mapping_cache;

public:
  ConstraintSlicer() = default;

  /**
   * Extract only the assertions needed to prove the unproven part of the
   * provided assertion list (+ extra) and return that as a new assertion list.
   * Note that the returned list does not include extra but does include the
   * assertions required to to prove extra.
   */
  AssertionList slice(const AssertionList& assertions, const Assertion& extra);

  /**
   * Get a list of all constants that are contained within the provided
   * expression.
   */
  llvm::ArrayRef<Symbol> contained_constants(const OpRef& expr);

private:
  void calc_contained_constants(const OpRef& expr,
                                std::unordered_set<Symbol>& out);
};

} // namespace caffeine
