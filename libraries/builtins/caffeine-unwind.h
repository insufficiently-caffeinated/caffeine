#pragma once

#ifdef __cplusplus
#include <unwind.h>
#include <string>

/***************************************************
 * Unwinding Functions                             *
 ***************************************************/

extern "C" {
  extern _Unwind_Reason_Code caffeine_unwind_phase1(const std::type_info* header);
}

#endif
