file(
  GLOB_RECURSE sources
  CONFIGURE_DEPENDS
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

file(
  GLOB_RECURSE headers
  CONFIGURE_DEPENDS
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h"
)

add_library(divine SHARED
  ${sources} ${headers}
)

target_include_directories(divine SYSTEM
  PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/>
  $<INSTALL_INTERFACE:include/>
)

# The SYSTEM should silence warnings within these headers
target_include_directories(divine SYSTEM
  PRIVATE "${LLVM_INCLUDE_DIRS}"
  PRIVATE "${FMT_INCLUDE_DIRS}"
)

set_property(TARGET divine PROPERTY POSITION_INDEPENDENT_CODE ON)
target_link_libraries(divine PRIVATE LLVMCore LLVMIRReader LLVMBitWriter LLVMTransformUtils)
