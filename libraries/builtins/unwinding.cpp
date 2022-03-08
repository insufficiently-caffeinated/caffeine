#include "caffeine-unwind.h"

#define _LIBCXXABI_HIDDEN
#define _LIBCXXABI_DATA_VIS
#define _LIBCXXABI_FUNC_VIS
#define _LIBCXXABI_TYPE_VIS

#include "cxxabi.h"
#include "cxa_exception.h"

#undef _LIBCXXABI_HIDDEN
#undef _LIBCXXABI_DATA_VIS
#undef _LIBCXXABI_FUNC_VIS
#undef _LIBCXXABI_TYPE_VIS


static const uint64_t kOurDependentExceptionClass = 0x434C4E47432B2B01;

// From llvm-project/libcxxabi/src/cxa_personality.cpp
static void* get_thrown_object_ptr(_Unwind_Exception* unwind_exception) {
  // Even for foreign exceptions, the exception object is *probably* at
  // unwind_exception + 1
  //    Regardless, this library is prohibited from touching a foreign exception
  void* adjustedPtr = unwind_exception + 1;
  if (__cxxabiv1::__getExceptionClass(unwind_exception) == kOurDependentExceptionClass)
    adjustedPtr = ((__cxxabiv1::__cxa_dependent_exception*)adjustedPtr - 1)
                      ->primaryException;
  return adjustedPtr;
}

static void setAdjPointer(_Unwind_Exception* unwind_exception,
                          __cxxabiv1::__cxa_exception* to_update) {
  to_update->adjustedPtr = get_thrown_object_ptr(unwind_exception);
}

static __cxxabiv1::__cxa_exception*
get_cxa_exception(_Unwind_Exception* unwind_exception) {
  return (__cxxabiv1::__cxa_exception*)(unwind_exception + 1) - 1;
}

extern "C" _Unwind_Reason_Code _Unwind_RaiseException(_Unwind_Exception* header) {
  __cxxabiv1::__cxa_exception * cxa_exception = get_cxa_exception(header);
  setAdjPointer(header, cxa_exception);

  _Unwind_Reason_Code reason = caffeine_unwind_phase1(cxa_exception->exceptionType, &cxa_exception->adjustedPtr);
  if (reason != _URC_NO_REASON) {
    return reason;
  }

  // caffeine_unwind_phase2 doesn't return
  caffeine_unwind_phase2(cxa_exception->exceptionType, &cxa_exception->adjustedPtr, header);
  return _URC_FATAL_PHASE2_ERROR;
}

extern "C" __attribute__((used)) void caffeine_resume_func(_Unwind_Exception* header) {
  __cxxabiv1::__cxa_exception * cxa_exception = get_cxa_exception(header);
  setAdjPointer(header, cxa_exception);

  // caffeine_unwind_phase2 doesn't return
  caffeine_unwind_phase2(cxa_exception->exceptionType, &cxa_exception->adjustedPtr, header);
  // But if it does, die
  abort();
}
