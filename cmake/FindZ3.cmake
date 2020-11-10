
include(FindPackageHandleStandardArgs)

# First check for an existing Z3 installation with a working
# config file. If we can find that then we don't need to do
# the rest of this.
find_package(Z3 ${Z3_FIND_VERSION} QUIET CONFIG)

if(Z3_FOUND)
  set(Z3_INCLUDE_DIRS "${Z3_C_INCLUDE_DIR}" "${Z3_CXX_INCLUDE_DIR}")

  target_include_directories(z3::libz3 INTERFACE "${Z3_INCLUDE_DIRS}")
  
  # Z3_LIBRARY doesn't seem to get set. We'll use our own status message
  # instead.
  if(NOT Z3_FIND_QUIETLY)
    message(STATUS "Found Z3: version \"${Z3_VERSION}\"")
  endif()

  return()
else()
  unset(Z3_FOUND)
endif()

# The default Z3 config has separate C and C++ include directories.
# I've duplicated that here.
if(Z3_DIR)
  find_path(Z3_C_INCLUDE_DIR   NAMES z3.h   PATHS "${Z3_DIR}/include" NO_DEFAULT_PATH)
  find_path(Z3_CXX_INCLUDE_DIR NAMES z3++.h PATHS "${Z3_DIR}/include" NO_DEFAULT_PATH)
else()
  find_path(Z3_C_INCLUDE_DIR   NAMES z3.h)
  find_path(Z3_CXX_INCLUDE_DIR NAMES z3++.h)
endif()

if(Z3_DIR)
  find_library(Z3_LIBRARY NAMES z3 PATHS "${Z3_DIR}/lib" NO_DEFAULT_PATH)
else()
  find_library(Z3_LIBRARY NAMES z3)
endif()

if(NOT (Z3_C_INCLUDE_DIR AND Z3_CXX_INCLUDE_DIR AND Z3_LIBRARY))
  unset(Z3_C_INCLUDE_DIR   CACHE)
  unset(Z3_CXX_INCLUDE_DIR CACHE)
  unset(Z3_LIBRARY         CACHE)

  find_package_handle_standard_args(
    Z3
    DEFAULT_MSG
    Z3_LIBRARY Z3_C_INCLUDE_DIR Z3_CXX_INCLUDE_DIR
  )
  return()
endif()

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

if ((NOT VERSION_TEST_COMPILED) OR NOT ("${VERSION_TEST_EXITCODE}" EQUAL 0))
  unset(Z3_C_INCLUDE_DIR   CACHE)
  unset(Z3_CXX_INCLUDE_DIR CACHE)
  unset(Z3_LIBRARY         CACHE)
  
  find_package_handle_standard_args(
    Z3
    DEFAULT_MSG
    Z3_LIBRARY Z3_C_INCLUDE_DIR Z3_CXX_INCLUDE_DIR
  )

  return()
endif()

if ("${VERSION_TEST_RUN_OUTPUT}" MATCHES "([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)")
  set(Z3_VERSION "${CMAKE_MATCH_1}")
else()
  set(Z3_VERSION "0.0.0.0")
endif()

if (
  ("${Z3_VERSION}" VERSION_LESS "${Z3_FIND_VERSION}") OR
  (Z3_FIND_VERSION_EXACT AND NOT "${Z3_VERSON}" VERSION_EQUAL "${Z3_FIND_VERSION}")
)
  unset(Z3_C_INCLUDE_DIR   CACHE)
  unset(Z3_CXX_INCLUDE_DIR CACHE)
  unset(Z3_LIBRARY         CACHE)

  find_package_handle_standard_args(
    Z3
    REQUIRED_VARS Z3_LIBRARY Z3_C_INCLUDE_DIR Z3_CXX_INCLUDE_DIR
    VERSION_VAR Z3_VERSION
  )
endif()

set(Z3_LIBRARIES z3::libz3)
set(Z3_INCLUDE_DIRS "${Z3_C_INCLUDE_DIR}" "${Z3_CXX_INCLUDE_DIR}")

add_library(z3::libz3 UNKNOWN IMPORTED)
set_target_properties(z3::libz3 PROPERTIES
  IMPORTED_LOCATION "${Z3_LIBRARY}"
  INTERFACE_INCLUDE_DIRECTORIES "${Z3_INCLUDE_DIRS}"
)

find_package_handle_standard_args(
  Z3
  REQUIRED_VARS Z3_INCLUDE_DIRS Z3_LIBRARIES
  VERSION_VAR Z3_VERSION
)

mark_as_advanced(
  Z3_LIBRARY Z3_LIBRARIES Z3_C_INCLUDE_DIR Z3_CXX_INCLUDE_DIR
)
