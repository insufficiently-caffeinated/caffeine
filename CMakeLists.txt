cmake_minimum_required(VERSION 3.8)

project(caffeine LANGUAGES C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")

find_program(CLANG_FORMAT clang-format)

set(CAFFEINE_FMTONLY OFF CACHE BOOL "Avoid building the project itself")
mark_as_advanced(CAFFEINE_FMTONLY)

if (NOT CAFFEINE_FMTONLY)

  find_package(LLVM 10.0 REQUIRED)
  find_package(GTest REQUIRED)
  find_package(Z3 4.8.7 REQUIRED)
  find_package(Boost REQUIRED)
  find_package(fmt REQUIRED)

  enable_testing()

  set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

  # C++17 has a bunch of nice stuff, seems like a good level to target.
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
  set(CMAKE_C_STANDARD 99)
  set(CMAKE_C_STANDARD_REQUIRED TRUE)

  include(setup-warnings)
  include(LLVMIRUtils)

  add_subdirectory(src)
  add_subdirectory(test)
  add_subdirectory(libraries)

else()
  if (CLANG_FORMAT STREQUAL "CLANG_FORMAT-NOTFOUND")
    message(ERROR "Unable to find clang-format")
  endif()
endif()

if (NOT CLANG_FORMAT STREQUAL "CLANG_FORMAT-NOTFOUND")
  include(formatting)
endif()

# This is only supported for cmake >= 3.17
if("${CMAKE_VERSION}" VERSION_GREATER_EQUAL "3.17")
  list(APPEND CMAKE_CTEST_ARGUMENTS "--output-on-failure")
endif()

