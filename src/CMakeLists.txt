
file(
  GLOB_RECURSE sources
  *.cpp
  *.hpp
  *.h
)

file(
  GLOB_RECURSE headers
  "${CMAKE_SOURCE_DIR}/include/*.hpp"
  "${CMAKE_SOURCE_DIR}/include/*.h"
  "${CMAKE_SOURCE_DIR}/include/*.inl"
)

add_library(caffeine STATIC ${sources} ${headers})

target_include_directories(caffeine 
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}"
  PUBLIC "${CMAKE_SOURCE_DIR}/include"
)
