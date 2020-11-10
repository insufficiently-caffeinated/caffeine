
file(
  GLOB_RECURSE tests
  CONFIGURE_DEPENDS
  *.cpp
  *.h
  *.hpp
)

add_executable(caffeine-unittest ${tests})
add_test(NAME unit-tests COMMAND caffeine-unittest)

target_link_libraries(caffeine-unittest PRIVATE caffeine)
target_link_libraries(caffeine-unittest PRIVATE GTest::GTest)
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_SOURCE_DIR}/include")
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
