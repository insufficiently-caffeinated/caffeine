
file(GLOB_RECURSE tests CONFIGURE_DEPENDS *.c *.cpp *.cc *.ll *.bc)

foreach(test ${tests})
  declare_test(TEST_NAME "${test}")
endforeach()
