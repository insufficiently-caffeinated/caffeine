
include(FindPackageHandleStandardArgs)

if (NOT Z3_SEARCH_NO_FOUND_MODULE)
  find_package(Z3 QUIET NO_MODULE)
endif()

if (Z3_FOUND)
  find_package_handle_standard_args(Z3 CONFIG_MODE)

  set(Z3_LIBRARIES    z3::libz3)
  set(Z3_INCLUDE_DIRS "${Z3_C_INCLUDE_DIR}" "${Z3_CXX_INCLUDE_DIR}")
  list(REMOVE_DUPLICATES Z3_INCLUDE_DIRS)

  target_include_directories(z3::libz3 INTERFACE "${Z3_INCLUDE_DIRS}")

  return()
endif()

find_path(Z3_C_INCLUDE_DIR   NAMES z3.h)
find_path(Z3_CXX_INCLUDE_DIR NAMES z3++.h)
find_library(Z3_LIBRARY      NAMES z3)

mark_as_advanced(Z3_C_INCLUDE_DIR Z3_CXX_INCLUDE_DIR Z3_LIBRARY)

if (NOT (Z3_C_INCLUDE_DIR AND Z3_CXX_INCLUDE_DIR AND Z3_LIBRARY))
  find_package_handle_standard_args(
    Z3
    REQUIRED_VARS Z3_LIBRARY Z3_C_INCLUDE_DIR Z3_CXX_INCLUDE_DIR
  )
endif()

set(Z3_LIBRARIES    z3::libz3)
set(Z3_INCLUDE_DIRS "${Z3_C_INCLUDE_DIR}" "${Z3_CXX_INCLUDE_DIR}")
list(REMOVE_DUPLICATES Z3_INCLUDE_DIRS)

if (NOT Z3_VERSION)
  # We need to somehow check the Z3 version. The easiest way to do this
  # is to just get it from Z3 itself.
  #
  # Unfortunately, this means that we need to actually run a program.
  # If we want to cross-compile anything then it'll be necessary to
  # revisit this and figure out some alternate way to do this.
  # It might be practical to parse out the version numbers from the
  # Z3 headers in that case.
  file(WRITE "${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/z3.c" "
    #include <stdio.h>
    #include \"z3.h\"
    int main() {
      unsigned major, minor, build_number, revision_number;
      Z3_get_version(&major, &minor, &build_number, &revision_number);
      printf(\"%u.%u.%u.%u\\n\", major, minor, build_number, revision_number);
      return 0;
    }
  ")

  try_run(
    VERSION_TEST_EXITCODE
    VERSION_TEST_COMPILED
    "${CMAKE_BINARY_DIR}/CMakeTmp/"
    "${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/z3.c"
    COMPILE_DEFINITIONS "-I${Z3_C_INCLUDE_DIR}"
    LINK_LIBRARIES "${Z3_LIBRARY}" "${GMP_LIBRARY}"
    CMAKE_FLAGS -DCMAKE_SKIP_RPATH:BOOL=${CMAKE_SKIP_RPATH}
    RUN_OUTPUT_VARIABLE VERSION_TEST_RUN_OUTPUT
  )

  if ("${VERSION_TEST_RUN_OUTPUT}" MATCHES "([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)")
    set(Z3_VERSION "${CMAKE_MATCH_1}" CACHE INTERNAL "")
  else()
    set(Z3_VERSION "0.0.0.0" CACHE INTERNAL "")
  endif()
endif()

find_package_handle_standard_args(
  Z3
  REQUIRED_VARS Z3_INCLUDE_DIRS
  VERSION_VAR Z3_VERSION
)

if (Z3_FOUND)
  add_library(z3::libz3 UNKNOWN IMPORTED)
  set_target_properties(z3::libz3 PROPERTIES
    IMPORTED_LOCATION "${Z3_LIBRARY}"
    INTERFACE_INCLUDE_DIRECTORIES "${Z3_INCLUDE_DIRS}"
  )

  set(Z3_SEARCH_NO_FOUND_MODULE TRUE CACHE INTERNAL "")
endif()
