
execute_process(
  COMMAND git reset --hard --quiet
  RESULT_VARIABLE EXITCODE
)

if (NOT EXITCODE EQUAL 0)
  message (FATAL_ERROR "Failed to reset repo")
endif()

execute_process(
  COMMAND git clean -fxd
  RESULT_VARIABLE EXITCODE
)

if (NOT EXITCODE EQUAL 0)
  message (FATAL_ERROR "Failed to clean repo")
endif()

set(ARG_NUM 1)
while (ARG_NUM LESS CMAKE_ARGC)
  set(ARG "${CMAKE_ARGV${ARG_NUM}}")

  if ("${ARG}" STREQUAL "-P")
    return()
  endif()

  execute_process(
    COMMAND git apply "${ARG}"
    RESULT_VARIABLE EXITCODE
  )

  if (NOT EXITCODE EQUAL 0)
    message (FATAL_ERROR "Failed to apply patch ${ARG}")
  endif()

  math(EXPR ARG_NUM "${ARG_NUM}+1")
endwhile()
