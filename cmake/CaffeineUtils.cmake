
# A wrapper around add_custom_command that also generates a
# target that wraps the generated file.
#
# Takes all the arguments of add_custom_command as well as some
# extra arguments:
# - TARGET: The name of the wrapper target to generate.
# - ALL:    Flag to specify whether the target should be built as
#           part of the ALL target. 
function(caffeine_custom_command)
  cmake_parse_arguments(PARSE_ARGV 0 ARG 
    "ALL"
    "TARGET;OUTPUT"
    "SOURCES"
  )
  
  if (ARG_ALL)
    set(ARG_ALL ALL)
  else()
    set(ARG_ALL "")
  endif()

  add_custom_command(
    OUTPUT "${ARG_OUTPUT}"
    ${ARG_UNPARSED_ARGUMENTS}
  )

  add_custom_target(
    "${ARG_TARGET}" ${ARG_ALL}
    DEPENDS "${ARG_OUTPUT}"
    SOURCES ${ARG_SOURCES}
  )

  set_target_properties(
    "${ARG_TARGET}" PROPERTIES
    OUTPUT "${ARG_OUTPUT}"
  )
endfunction()
