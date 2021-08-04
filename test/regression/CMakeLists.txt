
# Add a regression test case. Regression test files are named
# according to the following convention:
#
#     issue-<issue_no>.(pass|fail).<arbitrary-user-string>.<ext>
#
# This designed to quickly give context as well as a specification
# of whether the test is supposed to pass or fail. Other than that
# these use the normal test infra structure so putting the string
# "SKIP TEST" anywhere on the first line of the test file will
# cause it to be skipped.
function(add_regression_test source)
  get_filename_component(basename "${source}" NAME)

  set(EXPECTED PASS)
  if(basename MATCHES "^issue-([0-9]+|misc)\.(pass|fail)\.")
    if(CMAKE_MATCH_2 STREQUAL "fail")
      set(EXPECTED FAIL)
    endif()
  else()
    message(SEND_ERROR
      " Regression test didn't match naming convention!\n"
      " Expected the start of the test name to match\n"
      "    issue-([0-9]+|misc)\.(pass|fail)\.\n"
      " The actual test name was\n"
      "    ${basename}\n"
    )
  endif()

  declare_test(TEST_NAME "${source}" ${EXPECTED})
endfunction()

file(GLOB tests CONFIGURE_DEPENDS *.c *.ll *.cpp)

foreach(test ${tests})
  add_regression_test("${test}")
endforeach()
