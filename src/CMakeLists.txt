
file(
  GLOB_RECURSE sources
  CONFIGURE_DEPENDS
  *.cpp
  *.hpp
  *.h
)

file(
  GLOB_RECURSE headers
  CONFIGURE_DEPENDS
  "${CMAKE_SOURCE_DIR}/include/*.hpp"
  "${CMAKE_SOURCE_DIR}/include/*.h"
  "${CMAKE_SOURCE_DIR}/include/*.inl"
)

add_library(caffeine STATIC ${sources} ${headers})

target_include_directories(caffeine 
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}"
  PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/../include"
)

# The SYSTEM should silence warnings within these headers
target_include_directories(caffeine SYSTEM
  PUBLIC "${LLVM_INCLUDE_DIRS}"
  PUBLIC "${Z3_INCLUDE_DIRS}"
  PUBLIC "${FMT_INCLUDE_DIRS}"
  PUBLIC "${Boost_INCLUDE_DIRS}"
)
