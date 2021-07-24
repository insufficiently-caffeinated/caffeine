if (CAFFEINE_ENABLE_LIBC)

set_directory_properties(PROPERTIES COMPILE_DEFINITIONS "")
# Disable all warnings since it's not our code.
set_directory_properties(PROPERTIES COMPILE_OPTIONS "-w")

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/dummy.c" "")

add_custom_command(
  OUTPUT libcxx.ll
  COMMAND curl -L -O `curl -s 'https://api.github.com/repos/insufficiently-caffeinated/libcxx/releases/latest' | jq -r '.assets[0].browser_download_url'`
  COMMAND ${LLVM_DIS} libcxx.bc
)

llvm_library(libcxx libcxx.ll "${CMAKE_CURRENT_BINARY_DIR}/dummy.c")
llvm_link_libraries(libcxx PRIVATE musl_libc)

endif()
