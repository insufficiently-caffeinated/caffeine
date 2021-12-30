function(enable_libcxx)
if (CAFFEINE_ENABLE_LIBC)

set_directory_properties(PROPERTIES COMPILE_DEFINITIONS "")
# Disable all warnings since it's not our code.
set_directory_properties(PROPERTIES COMPILE_OPTIONS "-w")

find_program(JQ jq REQUIRED)

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/dummy.c" "")
set(CAFFEINE_LIBCXX_VERSION "v0.0.34")
set(RELEASE_URL "https://github.com/insufficiently-caffeinated/libcxx/releases/download/${CAFFEINE_LIBCXX_VERSION}/libcxx.bc")

message("Downloading libcxx.bc from ${RELEASE_URL}")
file(
  DOWNLOAD "${RELEASE_URL}"
  ${CMAKE_CURRENT_BINARY_DIR}/libcxx.bc
  TLS_VERIFY ON
  STATUS DOWNLOAD_STATUS
)

list(GET DOWNLOAD_STATUS 0 STATUS_CODE)
list(GET DOWNLOAD_STATUS 1 ERROR_MESSAGE)

if(NOT ${STATUS_CODE} EQUAL 0)
  message(FATAL_ERROR "Failed to download libcxx.bc ${ERROR_MESSAGE}")
endif()

llvm_library(libcxx ${CMAKE_CURRENT_BINARY_DIR}/libcxx.bc "${CMAKE_CURRENT_BINARY_DIR}/dummy.c")
llvm_link_libraries(libcxx PRIVATE libc)

endif()
endfunction()

enable_libcxx()
