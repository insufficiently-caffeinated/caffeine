
file(GLOB_RECURSE tests CONFIGURE_DEPENDS *.c *.cpp *.cc *.ll *.bc)

include(testutils)

foreach(test ${tests})
  declare_test(TEST_NAME "${test}")

  set_tests_properties(
    "${TEST_NAME}"
    PROPERTIES
    WILL_FAIL TRUE
  )
endforeach()
