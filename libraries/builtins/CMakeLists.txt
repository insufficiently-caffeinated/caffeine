
file(
  GLOB_RECURSE sources
  CONFIGURE_DEPENDS
  *.c
  *.h
  *.ll
)

llvm_library(caffeine-builtins
  ${sources}
  "${CMAKE_SOURCE_DIR}/interface/caffeine.h"
)

llvm_compile_options(caffeine-builtins PRIVATE -O3)
llvm_include_directories(caffeine-builtins PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
llvm_include_directories(caffeine-builtins PUBLIC "${CMAKE_SOURCE_DIR}/interface")
