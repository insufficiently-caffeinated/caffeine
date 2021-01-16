
function(separate_and_strip RETURN_VAR INPUT)
  separate_arguments(PARSED NATIVE_COMMAND "${INPUT}")

  set(STRIPPED "")
  foreach(ARG "${PARSED}")
    if(NOT "${ARG}" STREQUAL "")
      list(APPEND STRIPPED "${ARG}")
    endif()
  endforeach()

  set("${RETURN_VAR}" "${STRIPPED}" PARENT_SCOPE)
endfunction()

separate_and_strip(PROC_DEFINES "${DEFINES}")
separate_and_strip(PROC_FLAGS   "${FLAGS}")

set(PROC_INCLUDES "")
foreach(INC "${INCLUDES}")
  if (NOT "${INC}" STREQUAL "")
    list(APPEND PROC_INCLUDES "-I${INC}")
  endif()
endforeach()

execute_process(
  COMMAND "${COMPILER}" ${PROC_DEFINES} ${PROC_INCLUDES} ${PROC_FLAGS} -o "${OBJECT}" -c "${SOURCE}"
  RESULT_VARIABLE EXITVAL
)

if (NOT "${EXITVAL}" EQUAL 0)
  message(FATAL_ERROR "Compilation failed!")
endif()
