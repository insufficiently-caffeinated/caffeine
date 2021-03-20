
if (CAFFEINE_ENABLE_LIBC)

include(FetchContent)

set(MUSL_TARGET_PREFIX musl_ CACHE STRING "" FORCE)
mark_as_advanced(MUSL_TARGET_PREFIX)

set_directory_properties(PROPERTIES COMPILE_DEFINITIONS "")
# Disable all warnings since it's not our code.
set_directory_properties(PROPERTIES COMPILE_OPTIONS "-w")

FetchContent_Declare(
  libc
  GIT_REPOSITORY https://github.com/insufficiently-caffeinated/libc
  GIT_TAG        origin/cmake-bindings
  GIT_PROGRESS   TRUE
)

FetchContent_MakeAvailable(libc)

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/dummy.c" "")

llvm_library(libc "${CMAKE_CURRENT_BINARY_DIR}/dummy.c")
llvm_link_libraries(libc PRIVATE musl_libc)

endif()
