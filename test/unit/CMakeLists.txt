
include(GoogleTest)

file(
  GLOB_RECURSE tests
  CONFIGURE_DEPENDS
  *.cpp
  *.h
  *.hpp
)

add_executable(caffeine-unittest ${tests})

target_link_libraries(caffeine-unittest PRIVATE caffeine)
target_link_libraries(caffeine-unittest PRIVATE GTest::GTest)
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_SOURCE_DIR}/include")
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_SOURCE_DIR}")

if (${CMAKE_VERSION} VERSION_LESS "3.10.0")
  add_test(NAME unit-tests COMMAND caffeine-unittest)
else()
  # This lists all the tests individually 
  gtest_discover_tests(caffeine-unittest
    TEST_PREFIX unit/
    EXTRA_ARGS --gtest_catch_exceptions=0
  )
endif()
