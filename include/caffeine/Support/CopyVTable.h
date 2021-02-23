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
 * them then you should use this class. To actually make use of this class you
 * will have to call copy_vtable within the copy/move ctors/assigment operators.
 * This is because the compiler overwrites the vtable during construction of the
 * derived operation so copy_vtable needs to be called after the object is
 * initialized (i.e. within the body of the constructor).
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

  // Deleted so the user is forced to call copy_vtable
  CopyVTable(const CopyVTable&) noexcept = delete;
  CopyVTable(CopyVTable&&) noexcept = delete;

  CopyVTable& operator=(const CopyVTable&) noexcept = delete;
  CopyVTable& operator=(CopyVTable&&) noexcept = delete;

  void copy_vtable(const CopyVTable& vtable) noexcept;
};

} // namespace caffeine