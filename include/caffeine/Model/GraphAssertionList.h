#pragma once

#include "caffeine/Support/Assert.h"
#include <llvm/ADT/ArrayRef.h>
#include <tsl/hopscotch_set.h>
#include <vector>

namespace caffeine {

class EGraph;

/**
 * A list of assertions which are stored as e-class IDs.
 *
 * This class follows much the same design as AssertionList except that the
 * assertions are stored as e-class IDs. This also means that we are unable to
 * automatically reduce assertions with top level and nodes to multiple
 * assertions except during canonicalization.
 */
class GraphAssertionList {
private:
  std::vector<size_t> list_;
  tsl::hopscotch_set<size_t> lookup_;
  size_t mark_ = 0;

public:
  using const_iterator = decltype(list_)::const_iterator;

  GraphAssertionList() = default;

  size_t size() const {
    return list_.size();
  }
  bool empty() const {
    return size() == 0;
  }

  size_t operator[](size_t idx) const {
    return list_.at(idx);
  }

  // Replace all eclass IDs with their canonical form and remove any duplicates
  // introduced due to this.
  //
  // Note that this will invalidate any checkpoints that have been made.
  void canonicalize(const EGraph& egraph);

  // Mark that all the current assertions within this list are satisfiable.
  void mark_sat();

  void insert(size_t assertion);
  void insert(llvm::ArrayRef<size_t> assertions);

  bool contains(size_t assertion);

  const_iterator begin() const {
    return list_.begin();
  }
  const_iterator end() const {
    return list_.end();
  }

  llvm::ArrayRef<size_t> proven() const;
  llvm::ArrayRef<size_t> unproven() const;

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
};

} // namespace caffeine
