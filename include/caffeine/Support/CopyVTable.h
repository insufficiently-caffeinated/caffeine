#pragma once

namespace caffeine {

/**
 * Copy the vtable of all derived classes.
 *
 * Usage
 * =====
 * Have whatever class is at the base of your object hierarchy derive
 * CopyVTable.
 *
 * Explanation
 * ===========
 * By default, when you copy a potentially-derived instance of a base class in
 * C++ it doesn't copy the vtable of the object along with the rest of it (as
 * the destination has a new destination object). In most cases the behaviour
 * that you want is either the above behaviour or to disable copies entirely so
 * most of the time this serves as a fine default.
 *
 * However, if you know that all dervied classes will have exactly the same size
 * as the base class and you want to have the classes vtable copied along with
 * them then you should take use this class.
 *
 * Limitations
 * ===========
 * There are a few limitations in how well this class can work:
 * 1. Compilers will elide virtual calls when the class instance is present on
 *    the stack. This means that the requisite calls should always be done
 *    through a reference or pointer.
 * 2. CopyVTable must be used at the base of the inheritance heirarchy and is
 *    not compatible with multiple inheritance. It needs the vtable pointer to
 *    be stored within the CopyVTable instance in order for it to be copied
 *    between class instances.
 * 3. It is theoretically possible for a compiler to implement virtual function
 *    calls through something other than a vtable pointer. However, all current
 *    compilers have used a vtable pointer so this is more of a theoretical
 *    issue.
 */
class CopyVTable {
public:
  CopyVTable() = default;
  virtual ~CopyVTable() = default;

  CopyVTable(const CopyVTable&) noexcept;
  CopyVTable(CopyVTable&&) noexcept;

  CopyVTable& operator=(const CopyVTable&) noexcept;
  CopyVTable& operator=(CopyVTable&&) noexcept;

  void copy_vtable(const CopyVTable& vtable) noexcept;
};

} // namespace caffeine