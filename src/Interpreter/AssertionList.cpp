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
  mark_ = 0;
}

void AssertionList::mark_sat() {
  list_.compress();
  mark_ = list_.size();
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

void AssertionList::erase(const_iterator it) {
  lookup_.erase(*it);
  list_.erase(it.index());
}

size_t AssertionList::checkpoint() const {
  return list_.end().index();
}

void AssertionList::restore(size_t checkpoint) {
  auto it = list_.iterator_at(checkpoint);
  auto end = list_.end();

  if (it != end && !it.valid())
    ++it;

  for (; it != end; ++it) {
    lookup_.erase(*it);
    list_.erase(it);
  }
}

llvm::iterator_range<AssertionList::const_iterator>
AssertionList::unproven() const {
  auto it = list_.iterator_at(mark_);
  if (it != end() && !it.valid())
    ++it;

  return llvm::iterator_range<const_iterator>(it, end());
}

} // namespace caffeine
