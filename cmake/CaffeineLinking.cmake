# Global link-flags settings used in this project

set(LINK_FLAGS "")

if (CAFFEINE_ENABLE_LTO STREQUAL "ON" OR
    CAFFEINE_ENABLE_LTO STREQUAL "TRUE" OR
    CAFFEINE_ENABLE_LTO STREQUAL "FULL")
  if ("${CMAKE_VERSION}" VERSION_GREATER_EQUAL "3.9")
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    message(${CAFFEINE_WARNING} "LTO requires cmake 3.9 or greater.")
  endif()
elseif(CAFFEINE_ENABLE_LTO STREQUAL "THIN")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    add_compile_options(-flto=thin)
    list(APPEND LINK_FLAGS -flto=thin)
  else()
    message(${CAFFEINE_WARNING} "ThinLTO is only supported when compiling with clang")
  endif()
endif()

if (NOT CAFFEINE_USE_LINKER STREQUAL "")
  if (NOT MSVC)
    list(APPEND LINK_FLAGS "-fuse-ld=${CAFFEINE_USE_LINKER}")
  else()
    message(${CAFFEINE_WARNING} "CAFFEINE_USE_LINKER is not supported for MSVC")
  endif()
endif()
