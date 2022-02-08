#include "caffeine/Model/GraphAssertionList.h"
#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/OperationData.h"
#include <algorithm>

namespace caffeine {

void GraphAssertionList::canonicalize(const EGraph& egraph) {
  GraphAssertionList canonical;
  llvm::SmallVector<size_t> queued;

  for (size_t i = 0; i < size(); ++i) {
    if (i == mark_)
      canonical.mark_sat();

    queued.push_back(list_[i]);

    while (!queued.empty()) {
      size_t assertion = egraph.find(queued.pop_back_val());

      const EClass* eclass = egraph.get(assertion);
      CAFFEINE_ASSERT(eclass);

      if (auto data = llvm::dyn_cast<ConstantIntData>(
              eclass->nodes.front().data.get())) {
        // We have a literal false in the assertion list, clear everything and
        // change the overall list of assertions to just be [false]
        if (!data->value().getBoolValue()) {
          canonical.list_.clear();
          canonical.lookup_.clear();
          canonical.insert(assertion);

          if (i < mark_)
            canonical.mark_sat();

          goto done;
        } else {
          // There's no need to have assertions which are just the literal true.
          continue;
        }
      }

      // (and ?x1 ?x2) -> ?x1, ?x2
      auto it = std::find_if(
          eclass->nodes.begin(), eclass->nodes.end(),
          [](const ENode& node) { return node.opcode() == Operation::And; });
      if (it != eclass->nodes.end()) {
        for (size_t operand : it->operands)
          queued.push_back(operand);
        continue;
      }

      canonical.insert(assertion);
    }
  }

done:
  *this = std::move(canonical);
}

void GraphAssertionList::mark_sat() {
  mark_ = size();
}

void GraphAssertionList::insert(size_t assertion) {
  if (!lookup_.insert(assertion).second)
    return;

  list_.push_back(assertion);
}
void GraphAssertionList::insert(llvm::ArrayRef<size_t> assertions) {
  for (size_t assertion : assertions)
    insert(assertion);
}

bool GraphAssertionList::contains(size_t assertion) {
  return lookup_.contains(assertion);
}

llvm::ArrayRef<size_t> GraphAssertionList::proven() const {
  return llvm::ArrayRef<size_t>(list_.data(), list_.data() + mark_);
}
llvm::ArrayRef<size_t> GraphAssertionList::unproven() const {
  return llvm::ArrayRef<size_t>(list_.data() + mark_,
                                list_.data() + list_.size());
}

size_t GraphAssertionList::checkpoint() const {
  return size();
}
void GraphAssertionList::restore(size_t checkpoint) {
  CAFFEINE_ASSERT(checkpoint <= size());

  for (size_t i = checkpoint; i < size(); ++i) {
    lookup_.erase(list_[i]);
  }

  list_.resize(checkpoint);
}

} // namespace caffeine
