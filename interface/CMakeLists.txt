
add_llvm_ir_library(caffeine-builtins caffeine-builtins.c)

target_compile_options(caffeine-builtins PRIVATE -O3)
target_include_directories(caffeine-builtins PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
