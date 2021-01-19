
include(LLVMIRUtils)

# Extract the first line of the file into OUTVAR
function(extract_first_line RESULT FILE)
  file(READ "${FILE}" contents)

  # Convert file contents into a CMake list (where each element in the list
  # is one line of the file)
  #
  STRING(REGEX REPLACE ";" "\\\\;" contents "${contents}")
  STRING(REGEX REPLACE "\n" ";" contents "${contents}")

  list(POP_FRONT contents first_line)
  set(${RESULT} "${first_line}" PARENT_SCOPE)
endfunction()

function(should_skip_test RESULT testfile)
  extract_first_line(first_line "${testfile}")

  if ("${first_line}" MATCHES ".*SKIP TEST.*")
    set(${RESULT} TRUE PARENT_SCOPE)
  else()
    set(${RESULT} FALSE PARENT_SCOPE)
  endif()
endfunction()

# Utility function for declaring a test case
function(declare_test TEST_NAME_OUT test)
  file(RELATIVE_PATH test_name "${CMAKE_SOURCE_DIR}/test" "${test}")
  should_skip_test(should_skip "${test}")

  string(REGEX REPLACE "\\\\|/" "_" test_target "${test_name}")
  
  get_filename_component(test_ext "${test_name}" LAST_EXT)
  
  if("${test_ext}" STREQUAL ".ll" OR "${test_ext}" STREQUAL ".bc")
    set(test_output "${CMAKE_BINARY_DIR}/test/${test_name}")
  else()
    set(test_output "${CMAKE_BINARY_DIR}/test/${test_name}.ll")
  endif()

  get_filename_component(output_dir "${test_output}" DIRECTORY)
  get_filename_component(basename   "${test_output}" NAME_WLE)
  file(MAKE_DIRECTORY "${output_dir}")

  add_llvm_ir_library("${test_target}" "${test}")
  
  add_dependencies("${test_target}" caffeine-builtins)
  target_include_directories("${test_target}" PRIVATE "$<TARGET_PROPERTY:caffeine-builtins,INCLUDE_DIRECTORIES>")
  target_link_libraries     ("${test_target}" PRIVATE caffeine-builtins)
  target_compile_options    ("${test_target}" PRIVATE -O3)

  set_target_properties(
    "${test_target}"
    PROPERTIES
    OUTPUT_NAME "${basename}"
    LIBRARY_OUTPUT_DIRECTORY "${output_dir}"
  )

  if(should_skip)
    add_test(
      NAME "${test_name}"
      COMMAND skip-test "$<TARGET_FILE:${test_target}>"
    )
  else()
    add_test(
      NAME "${test_name}"
      COMMAND caffeine-bin "$<TARGET_FILE:${test_target}>" test
    )
  endif()

  set("${TEST_NAME_OUT}" "${test_name}" PARENT_SCOPE)

  set_tests_properties("${test_name}" PROPERTIES SKIP_RETURN_CODE 77)
endfunction()
