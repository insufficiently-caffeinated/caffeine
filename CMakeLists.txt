cmake_minimum_required(VERSION 3.8)

if (CMAKE_VERSION VERSION_GREATER "3.16")
  cmake_policy(SET CMP0097 NEW)
endif()

if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.20")
  cmake_policy(SET CMP0116 NEW)
endif()

project(caffeine LANGUAGES C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")


option(CAFFEINE_ENABLE_TESTS    "Enable test targets" ON)
option(CAFFEINE_ENABLE_FORMAT   "Enable formatting targets" ON)
option(CAFFEINE_BUILD_BITCODE   "If true compile tests and libraries down to bitcode, otherwise compile them to text IR" OFF)
option(CAFFEINE_ENABLE_IR_TESTS "Enable tests which involve handwritten LLVM IR" ON)
option(CAFFEINE_ENABLE_LIBC     "Build a bitcode libc for use in tests" OFF)
option(CAFFEINE_ENABLE_TRACING  "Enable tracing support within caffeine" OFF)

# Optimization settings
set(CAFFEINE_ENABLE_LTO OFF CACHE STRING "Enable link-time-optimizations. Valid values: ON, OFF, FULL, THIN")
set(CAFFEINE_USE_LINKER ""  CACHE STRING "Add -fuse-ld={name} to the link invocation.")

# Sanitizers
option(CAFFEINE_ENABLE_TSAN  "Build with ThreadSanitizer"  OFF)
option(CAFFEINE_ENABLE_ASAN  "Build with AddressSanitizer" OFF)
option(CAFFEINE_ENABLE_UBSAN "Build with UndefinedBehaviourSanitizer" OFF)
option(CAFFEINE_ENABLE_MSAN  "Build with MemorySanitizer"  OFF)
option(CAFFEINE_ENABLE_LSAN  "Build with LeakSanitizer"    OFF)

# Options used within CI but not really useful anywhere else
option(CAFFEINE_CI            "Enable options that are inconvenient for normal development but are used in CI" OFF)
option(CAFFEINE_ENABLE_BUILD  "Enable normal build targets" ON)

option(BUILD_SHARED_LIBS "Build libcaffeine as a shared library" OFF)

# Usually users probably don't want to disable the entirety of the project
mark_as_advanced(CAFFEINE_ENABLE_BUILD BUILD_SHARED_LIBS)

###########################################################
#            Non-option cmake configuration               #
###########################################################
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# C++17 has a bunch of nice stuff, seems like a good level to target.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED TRUE)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")

if (CAFFEINE_CI)
  # Normally these should be non-critical warnings (e.g. something that the
  # user can resolve by passing additional flags). However in CI we can't do
  # that so we want them to error out.
  set(CAFFEINE_WARNING ERROR)
else()
  set(CAFFEINE_WARNING WARNING)
endif()

# Easier string comparisons in the presence of random user casing
string(TOUPPER "${CAFFEINE_ENABLE_LTO}" CAFFEINE_ENABLE_LTO)

set(CAFFEINE_FMTONLY OFF CACHE BOOL "Avoid building the project itself")
mark_as_advanced(CAFFEINE_FMTONLY)

# Disable messages for targets on makefile generators
set_property(GLOBAL PROPERTY TARGET_MESSAGES OFF)

if (CAFFEINE_ENABLE_BUILD)

  # LLVM Requires an exact version specification so we need to do one
  # find_package call for each LLVM version we want to support
  find_package(LLVM 11.1)
  if (NOT LLVM_FOUND)
    find_package(LLVM 11.0 REQUIRED)
  endif()

  # TODO: We should have an option to download and build these locally if needed.
  find_package(GTest REQUIRED)
  find_package(Z3 4.8.7 REQUIRED)
  find_package(Boost REQUIRED)
  find_package(fmt REQUIRED)
  find_package(CapnProto REQUIRED)

  include(CaffeineDependencies)

  set(IR_USE_BITCODE ${CAFFEINE_BUILD_BITCODE})

  include(CaffeineSanitizers)
  include(CaffeineWarnings)
  include(CaffeineLinking)
  include(CaffeineFlags)
  include(LLVMIRUtils)

  make_directory("${CMAKE_BINARY_DIR}/gen/caffeine")
  configure_file(Config.h.in "${CMAKE_BINARY_DIR}/gen/caffeine/Config.h")
  
  if (CAFFEINE_ENABLE_TESTS)
    enable_testing()
  endif()

  add_subdirectory(src)
  add_subdirectory(libraries)
  add_subdirectory(tools)
  add_subdirectory(bench)

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
