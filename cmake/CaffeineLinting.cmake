function(create_lint_targets)

# Include any source directories that contain lintable code here
set(checked_dirs include src tools)
set(lint_sources "")

foreach(directory ${checked_dirs})
  file(
    GLOB_RECURSE lint_sources_tmp
    RELATIVE ${CMAKE_SOURCE_DIR}
    ${directory}/*.c
    ${directory}/*.cpp
    ${directory}/*.h
    ${directory}/*.hpp
    ${directory}/*.inl
  )
  list(APPEND lint_sources ${lint_sources_tmp})
endforeach()


set(linted "")
set(checked "")

foreach(source ${lint_sources})
  get_filename_component(source_dir "${source}" DIRECTORY)

  set(stamp_dir "${CMAKE_BINARY_DIR}/.lint/check")

  add_custom_command(
    OUTPUT "${stamp_dir}/${source}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${stamp_dir}/${source_dir}"
    COMMAND ${CLANG_TIDY} "${CMAKE_SOURCE_DIR}/${source}" --use-color --warnings-as-errors=* -p ${CMAKE_BINARY_DIR}/compile_commands.json | tee "${stamp_dir}/${source}"
    DEPENDS "${CMAKE_SOURCE_DIR}/${source}"
    COMMENT "Linting ${source}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
  )

  list(APPEND checked "${stamp_dir}/${source}")

  set(stamp_dir "${CMAKE_BINARY_DIR}/.lint/lint")

  add_custom_command(
    OUTPUT "${stamp_dir}/${source}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${stamp_dir}/${source_dir}"
    COMMAND ${CLANG_TIDY} "${CMAKE_SOURCE_DIR}/${source}" --use-color --fix --warnings-as-errors=* -p ${CMAKE_BINARY_DIR}/compile_commands.json | tee "${stamp_dir}/${source}"
    DEPENDS "${CMAKE_SOURCE_DIR}/${source}"
    COMMENT "Linting and fixing ${source}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
  )

  list(APPEND linted "${stamp_dir}/${source}")
endforeach()

add_custom_target(check-lint DEPENDS ${checked})
add_custom_target(lint       DEPENDS ${linted})

endfunction()

create_lint_targets()
