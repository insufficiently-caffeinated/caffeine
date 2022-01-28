#include "caffeine.h"
#include "unwind.h"
#include <typeinfo>

class Something {};
class Something2 : public Something {};
class Nothing {};

extern "C" {

extern _Unwind_Reason_Code caffeine_unwind_phase1(const std::type_info* header,
                                                  void**);

int test() {
  try {
    void* thing;
    _Unwind_Reason_Code res =
        caffeine_unwind_phase1(&typeid(Something2), &thing);
    caffeine_assert(res == _URC_NO_REASON);
  } catch (Something&) { return 0; }
  return 5;
}
}
