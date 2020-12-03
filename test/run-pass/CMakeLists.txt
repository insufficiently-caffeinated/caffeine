
file(GLOB c_tests   CONFIGURE_DEPENDS *.c)
file(GLOB cpp_tests CONFIGURE_DEPENDS *.cpp *.cc)
file(GLOB ir_tests  CONFIGURE_DEPENDS *.ll)

set(CLANG_FLAGS -S -emit-llvm -O3 -fcolor-diagnostics)

foreach(test ${ir_tests})
  file(RELATIVE_PATH test_file "${CMAKE_CURRENT_SOURCE_DIR}" "${test}")

  add_test(
    NAME "run-pass/${test_file}"
    COMMAND caffeine-bin "${test}" test
  )
endforeach()

if (NOT "${CLANG}" STREQUAL "CLANG-NOTFOUND")
  foreach(test ${c_tests})
    file(RELATIVE_PATH test_file "${CMAKE_CURRENT_SOURCE_DIR}" "${test}")
    set(TEST_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${test_file}.ll")

    add_custom_command(
      OUTPUT "${TEST_OUTPUT}"
      COMMAND "${CLANG}" "${test}" -o "${TEST_OUTPUT}" -std=c11 ${CLANG_FLAGS}
      MAIN_DEPENDENCY "${test}"
    )

    add_test(
      NAME "run-fail/${test_file}"
      COMMAND caffeine-bin "${TEST_OUTPUT}" test
    )

    list(APPEND test_files "${TEST_OUTPUT}")
  endforeach()
endif()

if (NOT "${CLANGXX}" STREQUAL "CLANGXX-NOTFOUND")
  foreach(test ${cpp_tests})
    file(RELATIVE_PATH test_file "${CMAKE_CURRENT_SOURCE_DIR}" "${test}")
    set(TEST_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${test_file}.ll")

    add_custom_command(
      OUTPUT "${TEST_OUTPUT}"
      COMMAND "${CLANGXX}" "${test}" -o "${TEST_OUTPUT}" -std=c++17 ${CLANG_FLAGS}
      MAIN_DEPENDENCY "${test}"
    )

    add_test(
      NAME "run-fail/${test_file}"
      COMMAND caffeine-bin "${TEST_OUTPUT}" test
    )

    list(APPEND test_files "${TEST_OUTPUT}")
  endforeach()
endif()

# Custom commands don't run by default. We need a target to force them
# to run.
add_custom_target(
  run-pass-tests ALL
  DEPENDS "${test_files}"
)

