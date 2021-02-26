
file(
  GLOB_RECURSE sources
  CONFIGURE_DEPENDS
  *.c
  *.h
  *.ll
)

add_llvm_ir_library(caffeine-builtins
  ${sources}
  "${CMAKE_SOURCE_DIR}/interface/caffeine.h"
)

target_compile_options(caffeine-builtins PRIVATE -O3)
target_include_directories(caffeine-builtins PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(caffeine-builtins PUBLIC "${CMAKE_SOURCE_DIR}/interface")
