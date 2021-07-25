function(enable_libcxx)
if (CAFFEINE_ENABLE_LIBC)

set_directory_properties(PROPERTIES COMPILE_DEFINITIONS "")
# Disable all warnings since it's not our code.
set_directory_properties(PROPERTIES COMPILE_OPTIONS "-w")

find_program(JQ jq REQUIRED)

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/dummy.c" "")
set(MANIFEST ${CMAKE_CURRENT_BINARY_DIR}/manifest.json)
file(DOWNLOAD https://api.github.com/repos/insufficiently-caffeinated/libcxx/releases/latest ${MANIFEST} TLS_VERIFY ON)

execute_process(
  COMMAND cat ${MANIFEST}
  COMMAND ${JQ} -r .assets[0].browser_download_url
  OUTPUT_VARIABLE RELEASE_URL
)

string(REGEX REPLACE "\n$" "" RELEASE_URL "${RELEASE_URL}")

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
llvm_link_libraries(libcxx PRIVATE musl_libc)

endif()
endfunction()

enable_libcxx()
