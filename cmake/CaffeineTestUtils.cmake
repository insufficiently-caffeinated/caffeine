
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

function(build_command)
  cmake_parse_arguments(
    ARG
    ""
    "COMMAND;OUTPUT;MAIN_DEPENDENCY;COMMENT"
    "ARGS;DEPENDS"
    ${ARGV}
  )

  string(REPLACE "<OUTPUT>"          "${ARG_OUTPUT}"          ARG_ARGS "${ARG_ARGS}")
  string(REPLACE "<MAIN_DEPENDENCY>" "${ARG_MAIN_DEPENDENCY}" ARG_ARGS "${ARG_ARGS}")

  set(DEPENDS "")
  if (DEFINED ARG_DEPENDS)
    set(DEPENDS "${ARG_DEPENDS}")
  endif()
  if (TARGET "${ARG_COMMAND}")
    list(APPEND DEPENDS "${ARG_COMMAND}")
  endif()

  set(COMMENT "")
  if (DEFINED ARG_COMMENT)
    set(COMMENT COMMENT "${ARG_COMMENT}")
  endif()

  add_custom_command(
    OUTPUT "${ARG_OUTPUT}"
    COMMAND "${ARG_COMMAND}" ARGS ${ARG_ARGS}
    MAIN_DEPENDENCY "${ARG_MAIN_DEPENDENCY}"
    DEPENDS ${DEPENDS}
    ${COMMENT}
  )
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

  set(OUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${test_target}.dir/gen")
  set(DIS_OUT "${output_dir}/${basename}${extra_ext}")

  make_directory("${output_dir}")
  make_directory("${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/gen")
  make_directory("${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/opt")

  llvm_library(
    "${test_target}" "${test}"
    OUTPUT "${OUT_DIR}/lib.bc"
  )

  add_dependencies        ("${test_target}" caffeine-builtins)
  llvm_include_directories("${test_target}" PRIVATE "$<TARGET_PROPERTY:caffeine-builtins,INCLUDE_DIRECTORIES>")
  llvm_link_libraries     ("${test_target}" PRIVATE caffeine-builtins)
  llvm_compile_options    ("${test_target}" PRIVATE -O3)


  build_command(
    OUTPUT "${OUT_DIR}/with-main.bc"
    MAIN_DEPENDENCY "${OUT_DIR}/lib.bc"
    COMMAND gen-test-main ARGS --skip-if-present -o <OUTPUT> <MAIN_DEPENDENCY> test
    COMMENT "Generating main method for ${test_target}"
    DEPENDS "$<TARGET_FILE:gen-test-main>"
  )

  build_command(
    OUTPUT "${OUT_DIR}/optimized.bc"
    MAIN_DEPENDENCY "${OUT_DIR}/with-main.bc"
    COMMAND "${LLVM_OPT}" ARGS -internalize -globaldce <MAIN_DEPENDENCY> -o <OUTPUT>
    COMMENT "Optimizing ${test_target}"
  )

  build_command(
    OUTPUT "${DIS_OUT}"
    MAIN_DEPENDENCY "${OUT_DIR}/optimized.bc"
    COMMAND "${LLVM_DIS}" ARGS <MAIN_DEPENDENCY> -o <OUTPUT>
    COMMENT "Disassembling test case ${test_name}"
  )

  add_custom_target(
    "gen-${test_target}" ALL
    DEPENDS "${DIS_OUT}"
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
