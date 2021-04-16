
# In Debug and RelWithDebInfo modes set -fno-omit-frame-pointer to make profiling
# with perf properly resolve call stacks.
add_compile_options(
  "$<$<AND:$<CXX_COMPILER_ID:GCC,Clang>,$<CONFIG:RelWithDebInfo>>:-fno-omit-frame-pointer>"
)
