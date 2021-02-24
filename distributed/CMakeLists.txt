

file(
  GLOB subdirs
  CONFIGURE_DEPENDS
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}/*"
)

set(sources "")

foreach(subdir ${subdirs})
  if (
    IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${subdir}"
    AND NOT "${subdir}" STREQUAL "bin")

    file(
      GLOB_RECURSE dir_sources
      CONFIGURE_DEPENDS
      "${subdir}/*.cpp"
      "${subdir}/*.hpp"
      "${subdir}/*.h"
    )

    list(APPEND sources ${dir_sources})
  endif()
endforeach()

file(
  GLOB_RECURSE headers
  CONFIGURE_DEPENDS
  "${CMAKE_SOURCE_DIR}/include/*.hpp"
  "${CMAKE_SOURCE_DIR}/include/*.h"
  "${CMAKE_SOURCE_DIR}/include/*.inl"
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.hpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h"
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.inl"
)

add_library(caffeine_distributed STATIC ${sources} ${headers})

target_include_directories(caffeine_distributed
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}"
  PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

# The SYSTEM should silence warnings within these headers
target_include_directories(caffeine_distributed SYSTEM
  PUBLIC "${LLVM_INCLUDE_DIRS}"
  PUBLIC "${Z3_INCLUDE_DIRS}"
  PUBLIC "${FMT_INCLUDE_DIRS}"
  PUBLIC "${Boost_INCLUDE_DIRS}"
)

target_link_options(caffeine_distributed PUBLIC ${LINK_FLAGS})
target_link_libraries(caffeine_distributed PUBLIC caffeine LLVMCore "${Z3_LIBRARIES}" fmt::fmt magic_enum capnp)
