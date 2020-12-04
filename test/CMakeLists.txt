
find_program(CLANG clang)
find_program(CLANGXX clang++)

if ("${CLANG}" STREQUAL "CLANG-NOTFOUND")
  message(WARNING "Unable to find clang. Certain tests will not be run")
endif()
if ("${CLANGXX}" STREQUAL "CLANGXX-NOTFOUND")
  message(WARNING "Unable to find clang++. Certain tests will not be run")
endif()

add_subdirectory(unit)
add_subdirectory(run-pass)
add_subdirectory(run-fail)
