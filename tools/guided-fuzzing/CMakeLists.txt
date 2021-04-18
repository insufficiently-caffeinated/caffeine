
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

if (CMAKE_VERSION VERSION_GREATER "3.16")
  cmake_policy(SET CMP0097 NEW)
endif()

caffeine_dependency(
  AFLplusplus                ""
  GIT_REPOSITORY             https://github.com/AFLplusplus/AFLplusplus
  GIT_TAG                    3.12c
  GIT_SHALLOW                TRUE
  GIT_SUBMODULES             ""
  PATCH_COMMAND  "${CMAKE_COMMAND}"
    "${CMAKE_SOURCE_DIR}/cmake/AFLplusplus.patch"
    -P "${CMAKE_SOURCE_DIR}/cmake/CaffeinePatch.cmake"
)

target_link_libraries(afl-guided-mutator PRIVATE caffeine)
set_property(TARGET caffeine PROPERTY POSITION_INDEPENDENT_CODE ON)
target_link_libraries(afl-guided-mutator PRIVATE LLVMCore LLVMIRReader LLVMBitWriter LLVMTransformUtils)
target_link_libraries(afl-guided-mutator PRIVATE fmt::fmt AFLplusplus)
