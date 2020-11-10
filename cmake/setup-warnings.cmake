# Global warnings settings used in this project

# Compiler-specific warning options
# Add more here as we find ones we want enabled.
if (MSVC)
  # This disables all warnings in headers included with angle brackets
  #
  # Since these should always be external dependencies in which we don't
  # care about warnings anyway this is a good thing
  add_compile_options(
    /experimental:external
    /external:anglebrackets
    /external:W0
  )

  # Enable more detailed warnings (but not all of them).
  add_compile_options(/W4)

  # Some code within LLVM triggers this. It's not something we can fix so
  # better to silence the warning than have it drown everything out.
  add_compile_definitions(_SILENCE_ALL_CXX17_DEPRECATION_WARNINGS=1)
elseif(UNIX)
  if (CMAKE_GENERATOR STREQUAL "Ninja")
    # By default error messages are emitted without colour when compiling
    # with Ninja. This turns on coloured diagnostics by default.
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      add_compile_options(-fdiagnostics-color=always)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
      add_compile_options(-fcolor-diagnostics)
    endif()
  endif()

  # Add more warnings here as we identify those we want
  if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    add_compile_options(-Wall -Wextra)
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    add_compile_options(-Wall -Wextra)
  endif()
endif()
