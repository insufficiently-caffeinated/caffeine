#pragma once

#ifdef __cplusplus
#include <unwind.h>
#include <string>

/***************************************************
 * Unwinding Functions                             *
 ***************************************************/

extern "C" {
  extern _Unwind_Reason_Code caffeine_unwind_phase1(const std::type_info* header, void** adjusted_ptr);
  [[ noreturn ]] extern void caffeine_unwind_phase2(const std::type_info* header, void** adjusted_ptr, _Unwind_Exception* uw_header);
}

#endif
