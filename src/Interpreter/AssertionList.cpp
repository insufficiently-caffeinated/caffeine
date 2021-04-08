#include "caffeine/Interpreter/AssertionList.h"
#include "caffeine/IR/Matching.h"
#include "caffeine/Support/Assert.h"
#include <algorithm>
#include <fmt/format.h>

namespace caffeine {

AssertionList::AssertionList(llvm::ArrayRef<Assertion> values) {
  lookup_.reserve(values.size());
  list_.reserve(values.size());

  insert(values);
}

void AssertionList::clear() {
  list_.clear();
  lookup_.clear();
}

void AssertionList::mark_sat() {
  mark_ = list_.backing_size();
}

void AssertionList::insert(const Assertion& assertion) {
  insert(llvm::ArrayRef<Assertion>{assertion});
}
void AssertionList::insert(llvm::ArrayRef<Assertion> assertions) {
  using namespace matching;

  llvm::SmallVector<OpRef, 8> decomposed;
  for (const Assertion& a : assertions) {
    decomposed.push_back(a.value());

    while (!decomposed.empty()) {
      OpRef op = decomposed.pop_back_val();
      OpRef lhs, rhs;

      // A & B -> A, B
      if (matches(op, And(lhs, rhs))) {
        decomposed.push_back(std::move(lhs));
        decomposed.push_back(std::move(rhs));
        continue;
      }

      // !(A | B) -> !A, !B
      if (matches(op, Not(Or(lhs, rhs)))) {
        decomposed.push_back(UnaryOp::CreateNot(lhs));
        decomposed.push_back(UnaryOp::CreateNot(rhs));
        continue;
      }

      if (a.is_constant_value(true))
        continue;

      if (lookup_.count(Assertion(op)))
        continue;

      list_.push_back(Assertion(op));
      lookup_.insert(Assertion(op));
    }
  }
}

bool AssertionList::contains(const Assertion& assertion) {
  return lookup_.count(assertion);
}

void AssertionList::compress() {
  if (mark_ < list_.backing_size()) {
    mark_ = std::distance(list_.begin(), ++list_.iterator_at(mark_));
  } else {
    mark_ = list_.size();
  }

  list_.compress();
}

void AssertionList::erase(const_iterator it) {
  lookup_.erase(*it);
  list_.erase(it.index());
}

} // namespace caffeine
