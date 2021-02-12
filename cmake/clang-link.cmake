
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

separate_and_strip(FLAGS "${FLAGS}")
separate_and_strip(PROC_LINK_LIBRARIES "${LINK_LIBRARIES}")
separate_and_strip(PROC_OBJECTS "${OBJECTS}")

set(OBJECTS "")
foreach(OBJ ${PROC_OBJECTS})
  if("${OBJ}" STREQUAL "")
    continue()
  endif()
  
  get_filename_component(ext "${OBJ}" LAST_EXT)

  if("${ext}" STREQUAL ".ll" OR "${ext}" STREQUAL ".bc")
    list(APPEND OBJECTS "${OBJ}")
  else()
    list(APPEND OBJECTS "${OBJ}${OBJ_EXT}")

    execute_process(
      COMMAND "${CMAKE_COMMAND}" -E copy_if_different "${OBJ}" "${OBJ}${OBJ_EXT}"
      RESULT_VARIABLE EXITVAL
    )

    if(NOT "${EXITVAL}" EQUAL 0)
      message(FATAL_ERROR "Pre-link copying step failed!")
    endif()
  endif()
endforeach()

# Strip away all linker flags
set(LINK_LIBRARIES "")
foreach(LIB ${PROC_LINK_LIBRARIES})
  if(NOT "${LIB}" MATCHES "^-[lL]")
    list(APPEND LINK_LIBRARIES "${LIB}")
  endif()
endforeach()

execute_process(
  COMMAND "${LINKER}" ${FLAGS} -o "${TARGET}" ${OBJECTS} ${LINK_LIBRARIES}
  RESULT_VARIABLE EXITVAL
)

if(NOT "${EXITVAL}" EQUAL 0)
  message(FATAL_ERROR "Link step failed! ${EXITVAL}")
endif()
