#include <typeinfo>
#include "caffeine.h"
#include "unwind.h"

class Something {};
class Something2 : public Something {};
class Nothing{};

extern "C" {

extern bool caffeine_can_catch(void* thrown_ty, void* catch_clause, void **thrown);

int test() {
    try {
        void* thing;
        caffeine_assert(caffeine_can_catch((void *) &typeid(Something2), (void *) &typeid(Something), &thing));
        caffeine_assert(caffeine_can_catch((void *) &typeid(Something), (void *) &typeid(Something2), &thing) == false);
    } catch (Something&) {
        return 0;
    }
    return 5;
}

}
