
find_program(CLANG   NAMES clang   clang-11)
find_program(CLANGXX NAMES clang++ clang++-11)

if ("${CLANG}" STREQUAL "CLANG-NOTFOUND")
  message(${CAFFEINE_WARNING}
    "Unable to find clang. Certain tests will not be run.\n"
    "Set -DCLANG=<path to clang> on the command line to resolve this error."
  )
endif()
if ("${CLANGXX}" STREQUAL "CLANGXX-NOTFOUND")
  message(${CAFFEINE_WARNING}
    "Unable to find clang++. Certain tests will not be run.\n"
    "Set -DCLANGXX=<path to clang> on the command line to resolve this error."
  )
endif()

include(CaffeineTestUtils)

add_subdirectory(unit)
add_subdirectory(run-pass)
add_subdirectory(run-fail)
add_subdirectory(regression)

set(YARPGEN_DIR "${CMAKE_CURRENT_SOURCE_DIR}/yarpgen")
if (EXISTS "${YARPGEN_DIR}")
  if (IS_DIRECTORY "${YARPGEN_DIR}")
    add_subdirectory(yarpgen)
  endif()
endif()

add_executable(skip-test skip-test.cpp)
target_link_options(skip-test PRIVATE ${LINK_FLAGS})
