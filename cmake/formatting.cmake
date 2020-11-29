
function(create_formatting_targets)

# Include any source directories that contain formattable code here
set(checked_dirs include src test)
set(fmt_sources "")

foreach(directory ${checked_dirs})
  file(
    GLOB_RECURSE fmt_sources_tmp
    RELATIVE ${CMAKE_SOURCE_DIR}
    ${directory}/*.c
    ${directory}/*.cpp
    ${directory}/*.h
    ${directory}/*.hpp
    ${directory}/*.inl
  )

  list(APPEND fmt_sources ${fmt_sources_tmp})
endforeach()

add_custom_target(format
  COMMAND ${CLANG_FORMAT} -i ${fmt_sources}
  VERBATIM
  WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)

set(formatted "")

foreach(source ${fmt_sources})
  get_filename_component(source_dir "${source}" DIRECTORY)
  get_filename_component(source_name "${source}" NAME)

  add_custom_command(
    OUTPUT "${CMAKE_BINARY_DIR}/.fmt/${source}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_BINARY_DIR}/.fmt/${source_dir}"
    COMMAND ${CLANG_FORMAT} "${CMAKE_SOURCE_DIR}/${source}" > "${CMAKE_BINARY_DIR}/.fmt/${source}"
    COMMAND diff -u "${CMAKE_SOURCE_DIR}/${source}" "${CMAKE_BINARY_DIR}/.fmt/${source}"
    DEPENDS "${CMAKE_SOURCE_DIR}/${source}"
    COMMENT "Checking formatting for ${source_name}"
  )

  list(APPEND formatted "${CMAKE_BINARY_DIR}/.fmt/${source}")
endforeach()

add_custom_target(check-format
  DEPENDS ${formatted}
)

endfunction()

create_formatting_targets()
