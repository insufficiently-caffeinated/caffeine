cmake_minimum_required(VERSION 3.8)

project(caffeine LANGUAGES C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")


option(CAFFEINE_ENABLE_TESTS  "Enable test targets" ON)
option(CAFFEINE_ENABLE_FORMAT "Enable formatting targets" ON)

# Optimization settings
set(CAFFEINE_ENABLE_LTO OFF CACHE STRING "Enable link-time-optimizations. Valid values: ON, OFF, FULL, THIN")
set(CAFFEINE_USE_LINKER ""  CACHE STRING "Add -fuse-ld={name} to the link invocation.")

# Options used within CI but not really useful anywhere else
option(CAFFEINE_CI            "Enable options that are inconvenient for normal development but are used in CI" OFF)
option(CAFFEINE_ENABLE_BUILD  "Enable normal build targets" ON)

# Usually users probably don't want to disable the entirety of the project
mark_as_advanced(CAFFEINE_ENABLE_BUILD)

###########################################################
#            Non-option cmake configuration               #
###########################################################
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# C++17 has a bunch of nice stuff, seems like a good level to target.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED TRUE)

if (CAFFEINE_CI)
  # Normally these should be non-critical warnings (e.g. something that the
  # user can resolve by passing additional flags). However in CI we can't do
  # that so we want them to error out.
  set(CAFFEINE_WARNING ERROR)
else()
  set(CAFFEINE_WARNING WARNING)
endif()

set(CAFFEINE_FMTONLY OFF CACHE BOOL "Avoid building the project itself")
mark_as_advanced(CAFFEINE_FMTONLY)

if (CAFFEINE_ENABLE_BUILD)
  # TODO: We should have an option to download and build these locally if needed.
  find_package(LLVM 10.0 REQUIRED)
  find_package(GTest REQUIRED)
  find_package(Z3 4.8.7 REQUIRED)
  find_package(Boost REQUIRED)
  find_package(fmt REQUIRED)

  include(CaffeineWarnings)
  include(CaffeineLinking)
  include(LLVMIRUtils)

  if (CAFFEINE_ENABLE_TESTS)
    enable_testing()
  endif()

  add_subdirectory(src)
  add_subdirectory(libraries)

  if (CAFFEINE_ENABLE_TESTS)
    add_subdirectory(test)
  endif()
endif()

find_program(CLANG_FORMAT clang-format)
if (CLANG_FORMAT STREQUAL "CLANG_FORMAT-NOTFOUND")
  message(
    ${CAFFEINE_WARNING} 
    "Unable to find clang-format. " 
    "Formatting target will not be configured. "
    "Specify CLANG_FORMAT to re-enable formatting."
  )
else()
  include(CaffeineFormatting)
endif()

# This is only supported for cmake >= 3.17
if("${CMAKE_VERSION}" VERSION_GREATER_EQUAL "3.17")
  list(APPEND CMAKE_CTEST_ARGUMENTS "--output-on-failure")
endif()

