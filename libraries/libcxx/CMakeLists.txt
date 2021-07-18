
if (CAFFEINE_ENABLE_LIBC)

set_directory_properties(PROPERTIES COMPILE_DEFINITIONS "")
# Disable all warnings since it's not our code.
set_directory_properties(PROPERTIES COMPILE_OPTIONS "-w")

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/dummy.c" "")

file(
  GLOB_RECURSE sources
  CONFIGURE_DEPENDS
  *.ll
)

llvm_library(libcxx "${sources}" "${CMAKE_CURRENT_BINARY_DIR}/dummy.c")
llvm_link_libraries(libcxx PRIVATE musl_libc)

endif()
