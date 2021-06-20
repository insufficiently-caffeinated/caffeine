
# In Debug and RelWithDebInfo modes set -fno-omit-frame-pointer to make profiling
# with perf properly resolve call stacks.
add_compile_options(
  "$<$<AND:$<CXX_COMPILER_ID:GCC,Clang>,$<CONFIG:RelWithDebInfo>>:-fno-omit-frame-pointer>"
)

# Most distributions of LLVM are built without RTTI, so we need to set this to avoid
# missing symbol errors.
add_compile_options(
  "$<$<CXX_COMPILER_ID:GCC,Clang>:-fno-rtti>"
)
