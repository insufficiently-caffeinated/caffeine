
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

  if("${test_ext}" STREQUAL ".ll")
    set(test_output "${CMAKE_BINARY_DIR}/test/${test_name}")
    set(test_artifact "${test_target}")
  else()
    set(test_output "${CMAKE_BINARY_DIR}/test/${test_name}.ll")
    set(test_artifact "${test_target}.ll")
  endif()
  set(extra_ext ".ll")

  get_filename_component(test_artifact_name "${test_artifact}" NAME_WLE)
  get_filename_component(output_dir "${test_output}" DIRECTORY)
  get_filename_component(basename   "${test_output}" NAME_WLE)

  set(TGT_OUT "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/lib/${test_artifact}")
  set(GEN_OUT "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/gen/${test_target}.ll")
  set(OPT_OUT "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/opt/${test_target}.bc")
  set(DIS_OUT "${output_dir}/${basename}${extra_ext}")

  make_directory("${output_dir}")
  make_directory("${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/gen")
  make_directory("${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/opt")

  llvm_library(
    "${test_target}" "${test}"
    OUTPUT "${TGT_OUT}"
  )

  add_dependencies        ("${test_target}" caffeine-builtins)
  llvm_include_directories("${test_target}" PRIVATE "$<TARGET_PROPERTY:caffeine-builtins,INCLUDE_DIRECTORIES>")
  llvm_link_libraries     ("${test_target}" PRIVATE caffeine-builtins)
  llvm_compile_options    ("${test_target}" PRIVATE -O3)

  add_custom_command(
    OUTPUT "${GEN_OUT}"
    COMMAND gen-test-main --skip-if-present -o "${GEN_OUT}" "${TGT_OUT}" test
    MAIN_DEPENDENCY "${TGT_OUT}"
    COMMENT Generating main method for "${test_target}"
  )

  # Remove unused methods
  add_custom_command(
    OUTPUT "${OPT_OUT}"
    COMMAND "${LLVM_OPT}" -internalize -globaldce "${GEN_OUT}" -o "${OPT_OUT}"
    MAIN_DEPENDENCY "${GEN_OUT}"
    COMMENT Optimizing "${test_target}"
  )

  add_custom_command(
    OUTPUT "${DIS_OUT}"
    COMMAND "${LLVM_DIS}" "${OPT_OUT}" -o "${DIS_OUT}"
    MAIN_DEPENDENCY "${OPT_OUT}"
    COMMENT "Disassembling test case ${test_name}"
  )

  add_custom_target(
    "gen-${test_target}" ALL
    DEPENDS "${DIS_OUT}"
    COMMENT "Built target gen-${test_target}"
  )

  if(should_skip)
    add_test(
      NAME "${test_name}"
      COMMAND skip-test "${DIS_OUT}"
    )
  else()
    add_test(
      NAME "${test_name}"
      COMMAND caffeine-bin "${DIS_OUT}" main
    )
  endif()

  set("${TEST_NAME_OUT}" "${test_name}" PARENT_SCOPE)

  set_tests_properties("${test_name}" PROPERTIES SKIP_RETURN_CODE 77)
endfunction()
