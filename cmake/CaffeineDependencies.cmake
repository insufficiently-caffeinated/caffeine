
include(FetchContent)

set(CAFFEINE_DEP_INSTALL_DIR "${CMAKE_BINARY_DIR}/_deps/install")
set(CAFFEINE_DEP_CONFIG_IN "${CMAKE_CURRENT_LIST_DIR}/CaffeineTemplateCMakeLists.txt.in")
list(APPEND CMAKE_PREFIX_PATH "${CAFFEINE_DEP_INSTALL_DIR}")

# Add a new dependency, or build it if it cannot be found on the local system.
#
# The first two arguments are the package name and the version that we need to
# find. These will be used for find_package. Any remaining arguments are passed
# through to ExternalProject_Add.
#
# How it Works
# ============
# The main idea is that, at configuration time, we use ExternalProject_Add in a
# separate cmake project to build and install the dependency to a local directory.
# From there, we can use find_package with the custom install directory added to
# the search path to find the dependencies.
#
# Now that that's happened the first time around, the next time find_package will
# immediately find the installed files and we can skip having to build anything.
function(caffeine_dependency PACKAGE VERSION)
  if (NOT $CACHE{${PACKAGE}_BUILT_LOCALLY})
    find_package(${PACKAGE} ${VERSION} QUIET)
    if (${PACKAGE}_FOUND)
      return()
    endif()
  endif()

  set(${PACKAGE}_BUILT_LOCALLY TRUE CACHE INTERNAL "")
  set(SUB_DIR "${CMAKE_BINARY_DIR}/_deps/${PACKAGE}/populate")
  set(PREFIX  "${CMAKE_BINARY_DIR}/_deps/${PACKAGE}")

  set(old_generator "$CACHE{CAFFEINE_DEPENDENCY_${PACKAGE}_GENERATOR}")
  if (NOT "${old_generator}" STREQUAL "${CMAKE_GENERATOR}")
    if ("${CMAKE_VERSION}" VERSION_LESS 3.17)
      execute_process(COMMAND "${CMAKE_COMMAND}" -E remove_directory "${PREFIX}")
    else()
      execute_process(COMMAND "${CMAKE_COMMAND}" -E rm -rf "${PREFIX}")
    endif()
  endif()

  set("CAFFEINE_DEPENDENCY_${PACKAGE}_GENERATOR" "${CMAKE_GENERATOR}" CACHE INTERNAL "")

  make_directory("${SUB_DIR}")

  set(QUOTED_ARGS "")
  foreach(ARG IN LISTS ARGN)
    set(QUOTED_ARGS "${QUOTED_ARGS} \"${ARG}\"")
  endforeach()

  set(PACKAGE_INSTALL_PREFIX "${CAFFEINE_DEP_INSTALL_DIR}")

  if (NOT "${CMAKE_BUILD_TYPE}" STREQUAL "")
    set(PACKAGE_CONFIGURATION_TYPES "${CMAKE_BUILD_TYPE}")
  else()
    set(PACKAGE_CONFIGURATION_TYPES "${CMAKE_CONFIGURATION_TYPES}")
  endif()

  configure_file("${CAFFEINE_DEP_CONFIG_IN}" "${SUB_DIR}/CMakeLists.copy.txt" @ONLY)

  set(NEEDS_UPDATE FALSE)
  if (NOT EXISTS "${SUB_DIR}/CMakeLists.txt")
    set(NEEDS_UPDATE TRUE)
  else()
    file(SHA512 "${SUB_DIR}/CMakeLists.txt"      OLD_HASH)
    file(SHA512 "${SUB_DIR}/CMakeLists.copy.txt" NEW_HASH)

    if (NOT "${OLD_HASH}" STREQUAL "${NEW_HASH}")
      set(NEEDS_UPDATE TRUE)
    endif()
  endif()

  # If the build script got updated then we need to build irregardless of
  # whether the dependency has been installed in the local dir before.
  if (NEEDS_UPDATE)
    file(RENAME "${SUB_DIR}/CMakeLists.copy.txt" "${SUB_DIR}/CMakeLists.txt")
  else()
    find_package(${PACKAGE} ${VERSION} QUIET)
    if (${PACKAGE}_FOUND)
      return()
    endif()
  endif()

  message(STATUS "Building dependency ${PACKAGE}")
  execute_process(
    COMMAND "${CMAKE_COMMAND}"
      -B "${SUB_DIR}"
      -S "${SUB_DIR}"
      -G "${CMAKE_GENERATOR}"
    RESULT_VARIABLE EXITCODE
  )

  if (NOT EXITCODE EQUAL 0)
    message(FATAL_ERROR "Could not configure ${PACKAGE} super-project")
  endif()

  execute_process(
    COMMAND "${CMAKE_COMMAND}" --build "${SUB_DIR}"
    RESULT_VARIABLE EXITCODE
  )

  if (NOT EXITCODE EQUAL 0)
    message(FATAL_ERROR "Failed to build ${PACKAGE}")
  endif()

  find_package(${PACKAGE} ${VERSION} REQUIRED)
endfunction()

caffeine_dependency(
  magic_enum     0.7.2
  GIT_REPOSITORY https://github.com/Neargye/magic_enum.git
  GIT_TAG        v0.7.2
  GIT_SHALLOW    TRUE
  CMAKE_CACHE_ARGS
    -DMAGIC_ENUM_OPT_BUILD_EXAMPLES:BOOL=FALSE
    -DMAGIC_ENUM_OPT_BUILD_TESTS:BOOL=FALSE
)

caffeine_dependency(
  # Note: for some reason the generated ImmerConfig.cmake doesn't have a version.
  #       To make things work here we explicitly set the version to nothing.
  Immer          ""
  GIT_REPOSITORY https://github.com/arximboldi/immer
  GIT_TAG        v0.6.2
  GIT_SHALLOW    TRUE
  PATCH_COMMAND  "${CMAKE_COMMAND}"
    "${CMAKE_CURRENT_LIST_DIR}/immer.patch"
    -P "${CMAKE_CURRENT_LIST_DIR}/CaffeinePatch.cmake"
  GIT_SUBMODULES ""
)

caffeine_dependency(
  AFLplusplus                ""
  GIT_REPOSITORY             https://github.com/AFLplusplus/AFLplusplus
  GIT_TAG                    3.12c
  GIT_SHALLOW                TRUE
  GIT_SUBMODULES             ""
  PATCH_COMMAND  "${CMAKE_COMMAND}"
    "${CMAKE_SOURCE_DIR}/cmake/AFLplusplus.patch"
    -P "${CMAKE_SOURCE_DIR}/cmake/CaffeinePatch.cmake"
)
