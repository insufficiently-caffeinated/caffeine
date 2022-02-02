
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
target_link_libraries(caffeine-unittest PRIVATE LLVMIRReader)
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_SOURCE_DIR}/include")
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_SOURCE_DIR}")
target_include_directories(caffeine-unittest PRIVATE "${CMAKE_BINARY_DIR}/gen/")
target_compile_definitions(caffeine-unittest PRIVATE CAFFEINE_EXPOSE_FOR_TESTING)

if (CAFFEINE_ENABLE_COVERAGE)
  add_test(
    NAME unit-tests 
    COMMAND "${CMAKE_COMMAND}" -E env
      "LLVM_PROFILE_FILE=${CMAKE_CURRENT_BINARY_DIR}/default.%p.profraw"
      "$<TARGET_FILE:caffeine-unittest>"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  )
elseif (${CMAKE_VERSION} VERSION_LESS "3.10.0")
  add_test(
    NAME unit-tests
    COMMAND caffeine-unittest
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  )
else()
  # This lists all the tests individually
  gtest_discover_tests(caffeine-unittest
    TEST_PREFIX unit/
    EXTRA_ARGS --gtest_catch_exceptions=0
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  )
endif()
