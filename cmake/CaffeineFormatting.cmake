
function(create_formatting_targets)

# Include any source directories that contain formattable code here
set(checked_dirs include src test third_party tools)
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

set(formatted "")
set(checked "")

foreach(source ${fmt_sources})
  get_filename_component(source_dir "${source}" DIRECTORY)

  set(stamp_dir "${CMAKE_BINARY_DIR}/.fmt/check")

  add_custom_command(
    OUTPUT "${stamp_dir}/${source}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${stamp_dir}/${source_dir}"
    COMMAND ${CLANG_FORMAT} "${CMAKE_SOURCE_DIR}/${source}" > "${stamp_dir}/${source}"
    COMMAND diff --color=always -u "${source}" "${stamp_dir}/${source}"
    DEPENDS "${CMAKE_SOURCE_DIR}/${source}"
    COMMENT "Checking formatting for ${source}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
  )

  list(APPEND checked "${stamp_dir}/${source}")

  set(stamp_dir "${CMAKE_BINARY_DIR}/.fmt/fmt")

  add_custom_command(
    OUTPUT "${stamp_dir}/${source}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${stamp_dir}/${source_dir}"
    COMMAND ${CLANG_FORMAT} -i "${CMAKE_SOURCE_DIR}/${source}"
    COMMAND ${CMAKE_COMMAND} -E touch "${stamp_dir}/${source}"
    DEPENDS "${CMAKE_SOURCE_DIR}/${source}"
    COMMENT "Formatting ${source}"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
  )

  list(APPEND formatted "${stamp_dir}/${source}")
endforeach()

add_custom_target(check-format DEPENDS ${checked})
add_custom_target(format       DEPENDS ${formatted})

endfunction()

create_formatting_targets()
