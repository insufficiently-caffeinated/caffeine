
file(GLOB_RECURSE c_tests   CONFIGURE_DEPENDS *.c)
file(GLOB_RECURSE cpp_tests CONFIGURE_DEPENDS *.cpp *.cc)
file(GLOB_RECURSE ir_tests  CONFIGURE_DEPENDS *.ll)

set(CLANG_FLAGS -S -emit-llvm -O3 -fcolor-diagnostics "-I${CMAKE_SOURCE_DIR}/interface")

include(testutils)


foreach(test ${ir_tests})
  file(RELATIVE_PATH test_file "${CMAKE_CURRENT_SOURCE_DIR}" "${test}")
  should_skip_test(should_skip "${test}")

  if (should_skip)
    add_test(
      NAME "run-fail/${test_file}"
      COMMAND skip-test "${test}" test
    )
  else()
    add_test(
      NAME "run-fail/${test_file}"
      COMMAND caffeine-bin "${test}" test
    )
  endif()
  
  set_tests_properties(
    "run-fail/${test_file}"
    PROPERTIES
    WILL_FAIL TRUE
    SKIP_RETURN_CODE 77
  )
endforeach()

if (NOT "${CLANG}" STREQUAL "CLANG-NOTFOUND")
  foreach(test ${c_tests})
    file(RELATIVE_PATH test_file "${CMAKE_CURRENT_SOURCE_DIR}" "${test}")
    set(TEST_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${test_file}.ll")
    should_skip_test(should_skip "${test}")

    get_filename_component(output_dir "${TEST_OUTPUT}" DIRECTORY)
    file(MAKE_DIRECTORY "${output_dir}")

    add_custom_command(
      OUTPUT "${TEST_OUTPUT}"
      COMMAND "${CLANG}" -std=c11 ${CLANG_FLAGS} "${test}" -o "${TEST_OUTPUT}"
      MAIN_DEPENDENCY "${test}"
    )

    if (should_skip)
      add_test(
        NAME "run-fail/${test_file}"
        COMMAND skip-test "${test}" test
      )
    else()
      add_test(
        NAME "run-fail/${test_file}"
        COMMAND caffeine-bin "${TEST_OUTPUT}" test
      )
    endif()

    set_tests_properties(
      "run-fail/${test_file}"
      PROPERTIES
      WILL_FAIL TRUE
      SKIP_RETURN_CODE 77
    )

    list(APPEND test_files "${TEST_OUTPUT}")
  endforeach()
endif()

if (NOT "${CLANGXX}" STREQUAL "CLANGXX-NOTFOUND")
  foreach(test ${cpp_tests})
    file(RELATIVE_PATH test_file "${CMAKE_CURRENT_SOURCE_DIR}" "${test}")
    set(TEST_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${test_file}.ll")
    should_skip_test(should_skip "${test}")

    get_filename_component(output_dir "${TEST_OUTPUT}" DIRECTORY)
    file(MAKE_DIRECTORY "${output_dir}")

    add_custom_command(
      OUTPUT "${TEST_OUTPUT}"
      COMMAND "${CLANGXX}" -std=c++17 ${CLANG_FLAGS} "${test}" -o "${TEST_OUTPUT}"
      MAIN_DEPENDENCY "${test}"
    )

    if (should_skip)
      add_test(
        NAME "run-fail/${test_file}"
        COMMAND skip-test "${test}" test
      )
    else()
      add_test(
        NAME "run-fail/${test_file}"
        COMMAND caffeine-bin "${TEST_OUTPUT}" test
      )
    endif()

    set_tests_properties(
      "run-fail/${test_file}"
      PROPERTIES
      WILL_FAIL TRUE
      SKIP_RETURN_CODE 77
    )

    list(APPEND test_files "${TEST_OUTPUT}")
  endforeach()
endif()

# Custom commands don't run by default. We need a target to force them
# to run.
add_custom_target(
  run-fail-tests ALL
  DEPENDS "${test_files}"
)

