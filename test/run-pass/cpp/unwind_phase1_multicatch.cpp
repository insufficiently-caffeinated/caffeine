#include "caffeine.h"
#include "unwind.h"
#include <typeinfo>

class Something {};
class SomethingElse {};

extern "C" {

extern _Unwind_Reason_Code caffeine_unwind_phase1(const std::type_info* header,
                                                  void**);

int test() {
  try {
    void* thing;
    _Unwind_Reason_Code res =
        caffeine_unwind_phase1(&typeid(Something), &thing);
    caffeine_assert(res == _URC_NO_REASON);
  } catch (Something&) { return 0; } catch (SomethingElse&) {
    return 4;
  }
  return 5;
}
}
