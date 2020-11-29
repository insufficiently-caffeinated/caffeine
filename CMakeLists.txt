cmake_minimum_required(VERSION 3.8)

project(caffeine LANGUAGES C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")

find_package(LLVM 10.0 REQUIRED)
find_package(GTest REQUIRED)
find_package(Z3 4.8.7 REQUIRED)
find_package(Boost REQUIRED)
find_package(fmt REQUIRED)

find_program(CLANG_FORMAT clang-format)

enable_testing()

set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# C++17 has a bunch of nice stuff, seems like a good level to target.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

include(setup-warnings)

add_subdirectory(src)
add_subdirectory(test)

file(
  GLOB_RECURSE fmt_sources
  *.c
  *.cpp
  *.h
  *.hpp
  *.inl
)

if (NOT CLANG_FORMAT STREQUAL "CLANG_FORMAT-NOTFOUND")
  include(formatting)
endif()

