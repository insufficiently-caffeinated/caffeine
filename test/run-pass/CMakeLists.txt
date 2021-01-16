
file(GLOB_RECURSE tests CONFIGURE_DEPENDS *.c *.cpp *.cc *.ll *.bc)

include(testutils)

foreach(test ${tests})
  file(RELATIVE_PATH test_file "${CMAKE_CURRENT_SOURCE_DIR}" "${test}")
  should_skip_test(should_skip "${test}")
  
  string(REGEX REPLACE "\\\\|/" "_" TEST_TARGET "run-pass/${test_file}")
  set(TEST_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${test_file}")

  get_filename_component(output_dir "${TEST_OUTPUT}" DIRECTORY)
  get_filename_component(basename "${TEST_OUTPUT}" NAME)
  file(MAKE_DIRECTORY "${output_dir}")

  add_llvm_ir_library("${TEST_TARGET}" "${test}")

  add_dependencies("${TEST_TARGET}" caffeine-builtins)
  target_link_libraries("${TEST_TARGET}" PRIVATE caffeine-builtins)
  target_include_directories("${TEST_TARGET}" PRIVATE "${CMAKE_SOURCE_DIR}/interface")
  target_compile_options("${TEST_TARGET}" PRIVATE -O3)

  if (should_skip)
    add_test(
      NAME "run-pass/${test_file}"
      COMMAND skip-test "${test}" test
    )
  else()
    add_test(
      NAME "run-pass/${test_file}"
      COMMAND caffeine-bin "$<TARGET_FILE:${TEST_TARGET}>" test
    )
  endif()

  set_tests_properties(
    "run-pass/${test_file}"
    PROPERTIES
    SKIP_RETURN_CODE 77
  )
endforeach()
