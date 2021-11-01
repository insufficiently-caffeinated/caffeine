#pragma once

#include "caffeine/ADT/SparseVector.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/IR/Operation.h"
#include <boost/range/join.hpp>
#include <initializer_list>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/FunctionExtras.h>
#include <unordered_set>
#include <vector>

namespace caffeine {

// A list of assertions.
//
// This class is designed to allow other algorithms which have to regularly
// operate on the list of assertions to easily be written as incremental
// algorithms.
//
// Overall Design
// ==============
// The assertions contained within this class are split into two groups:
// - There are the assertions that have been proven to be satisfiable by running
//   through a solver and it returning SAT. Adding new assertions does not
//   change the satisfiability of these assertions.
// - Next, there are the assertions that have not yet been proven to be
//   satisfiable. These double as new information since the last solver call and
//   so are useful for incrementally simplifying the overall expressions.
//
// Assertions get moved to the first group from the second one when mark_sat()
// is called. This should only be called once a solver evaluates the expression
// and determines that it is satisfiable.
class AssertionList {
private:
  SparseVector<Assertion> list_;
  std::unordered_set<Assertion> lookup_;
  size_t mark_ = 0;

public:
  using const_iterator = decltype(list_)::const_iterator;

  enum Status { Proven, Unproven };

  AssertionList() = default;

  AssertionList(llvm::ArrayRef<Assertion> values);
  AssertionList(std::initializer_list<Assertion> list)
      : AssertionList(llvm::ArrayRef<Assertion>(list)) {}

  size_t size() const {
    return lookup_.size();
  }
  bool empty() const {
    return size() == 0;
  }

  const Assertion& operator[](size_t idx) const {
    return list_[idx];
  }

  void clear();

  // Mark all expressions currently within this AssertionList as having been
  // proven to be satisfiable.
  void mark_sat();

  // Insert a new assertion at the end of the list.
  //
  // Automatically decomposes expressions composed of multiple terms ANDed
  // together into their component expressions. This is to help normalize the
  // representation of assertions. (The assertions within the list are already
  // anded together.)
  //
  // This will also deduplicate inserted expressions. If an expression is
  // already present within the list then it will not be inserted.
  void insert(const Assertion& assertion);
  void insert(llvm::ArrayRef<Assertion> assertions);

  // Efficiently check whether this list contains the given assertion.
  bool contains(const Assertion& assertion);

  void erase(const_iterator it);

  const SparseVector<Assertion>& backing() const {
    return list_;
  }

  const_iterator begin() const {
    return list_.begin();
  }
  const_iterator end() const {
    return list_.end();
  }

  llvm::iterator_range<const_iterator> unproven() const;
  llvm::iterator_range<const_iterator> proven() const;

  /**
   * Create a checkpoint of the current position of the tail of the list. This
   * allows for items to be temporarily inserted into the list and then removed
   * once no longer needed.
   *
   * The number returned by this method is the index of the end iterator in the
   * backing array.
   *
   * To remove all items inserted since the corresponding checkpoint call the
   * restore method.
   */
  size_t checkpoint() const;
  void restore(size_t checkpoint);

  void DebugPrint() const;
};

} // namespace caffeine
