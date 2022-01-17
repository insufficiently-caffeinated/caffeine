
set(sources 
  plugin.cpp
)

function(add_sources DIR)
  set(sources_local "${sources}")
  foreach(source ${ARGN})
    list(APPEND sources_local "${DIR}/${source}")
  endforeach()
  set(sources "${sources_local}" PARENT_SCOPE)
endfunction()


add_sources(builtins
  assert.cpp
  memcpy.cpp
  memmove.cpp
  resolve.cpp
  plugin.cpp
  builtins.h
)

add_sources(test-main
  plugin.cpp
)

add_sources(strip
  plugin.cpp
)

add_sources(set-source
  plugin.cpp
)

add_library(caffeine-opt-plugin SHARED ${sources})

target_include_directories(caffeine-opt-plugin SYSTEM
  PRIVATE "${LLVM_INCLUDE_DIRS}"
  PRIVATE "${FMT_INCLUDE_DIRS}"
)
target_include_directories(caffeine-opt-plugin 
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}"
)

set_property(TARGET caffeine-assert PROPERTY POSITION_INDEPENDENT_CODE ON)

# Note that we explicitly don't want to link in LLVM
# target_link_libraries(caffeine-opt-plugin PRIVATE LLVMCore)
target_link_libraries(caffeine-opt-plugin PRIVATE fmt::fmt)
target_link_libraries(caffeine-opt-plugin PRIVATE caffeine-assert)

set_target_properties(
  caffeine-opt-plugin PROPERTIES
  DISABLE_ASAN TRUE
)
