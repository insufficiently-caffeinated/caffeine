
add_library(caffeine-assert OBJECT
  Assert.cpp
  "${CMAKE_SOURCE_DIR}/include/caffeine/Support/Assert.h"
)

target_include_directories(caffeine-assert PUBLIC "${CMAKE_SOURCE_DIR}/include")
target_include_directories(caffeine-assert SYSTEM PRIVATE "${Boost_INCLUDE_DIRS}")

set_target_properties(
  caffeine-assert PROPERTIES
  DISABLE_ASAN TRUE
)
