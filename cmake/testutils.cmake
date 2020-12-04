
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
