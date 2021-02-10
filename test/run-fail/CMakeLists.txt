
file(GLOB_RECURSE tests CONFIGURE_DEPENDS *.c *.cpp *.cc *.ll *.bc)

foreach(test ${tests})
  declare_test(TEST_NAME "${test}")

  set_tests_properties(
    "${TEST_NAME}"
    PROPERTIES
    WILL_FAIL TRUE
  )
endforeach()

target_compile_options(run-fail_mem_alloca-escaped.c PRIVATE -Wno-return-stack-address)
