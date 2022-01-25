#include "private_typeinfo.h"

// Basically taken from
// https://github.com/emscripten-core/emscripten/blob/ecbd9f6e814ca4e2b4bdbcbb085b7a083854a930/system/lib/libcxxabi/src/private_typeinfo.cpp#L1339
extern "C" bool __attribute__((used)) caffeine_can_catch(void* thrown_ty, void* catch_clause, void **thrown) {
  __cxxabiv1::__shim_type_info *t1 = static_cast<__cxxabiv1::__shim_type_info*>((std::type_info*)catch_clause);
  __cxxabiv1::__shim_type_info *t2 = static_cast<__cxxabiv1::__shim_type_info*>((std::type_info*)thrown_ty);
  void *temp = *thrown;
  bool ret = t1->can_catch(t2, temp);
  if (ret) *thrown = temp; // apply changes only if we are catching
  return ret;
}
