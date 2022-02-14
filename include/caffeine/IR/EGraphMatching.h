#pragma once

#include "caffeine/IR/EGraph.h"

namespace caffeine {

namespace ematching {

  // A custom filter for a subclause for any other conditions beyond filtering
  // based on opcode.
  //
  // This class needs to be hashable and comparable so it's also necessary for
  // any derived class to implement the hash and is_equal virtual methods,
  // respectively. The implementation in the parent class will ensure that
  // is_equal is only called when the types are equal.
  class SubClauseFilter {
  public:
    // Check whether the passed-in ENode is a valid match. If this returns false
    // then the node will not be considered as a match for this sub-clause.
    virtual bool matches(const ENode& node) const = 0;

    bool operator==(const SubClauseFilter& filter) const;
    bool operator!=(const SubClauseFilter& filter) const;

    virtual ~SubClauseFilter() = default;

  protected:
    SubClauseFilter(const void* type) : type(type) {}

  private:
    // Compare whether this class is equal to the derived one.
    //
    // This will only be called if the other class has the same type as this
    // one.
    virtual bool is_equal(const SubClauseFilter& other) const = 0;
    virtual size_t hash() const = 0;

    friend llvm::hash_code hash_value(const SubClauseFilter& filter);

  private:
    const void* type;
  };

} // namespace ematching

} // namespace caffeine
