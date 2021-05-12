# Definition required otherwise AFL defines "R" which breaks some LLVM code ಠ_ಠ
add_compile_definitions(AFL_LLVM_PASS=1)

file(
  GLOB sources
  CONFIGURE_DEPENDS
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

file(
  GLOB_RECURSE headers
  CONFIGURE_DEPENDS
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.hpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h"
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.inl"
)

add_library(afl-guided-mutator SHARED
  ${sources}
  ${headers}
)

# The SYSTEM should silence warnings within these headers
target_include_directories(afl-guided-mutator SYSTEM
  PRIVATE "${LLVM_INCLUDE_DIRS}"
  PRIVATE "${FMT_INCLUDE_DIRS}"
)

target_link_libraries(afl-guided-mutator PRIVATE caffeine)
set_property(TARGET caffeine PROPERTY POSITION_INDEPENDENT_CODE ON)
target_link_libraries(afl-guided-mutator PRIVATE LLVMCore LLVMIRReader LLVMBitWriter LLVMTransformUtils)
target_link_libraries(afl-guided-mutator PRIVATE fmt::fmt AFLplusplus)
