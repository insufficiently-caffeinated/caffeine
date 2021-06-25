file(
  GLOB sources
  CONFIGURE_DEPENDS
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

file(
  GLOB includes
  CONFIGURE_DEPENDS
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h"
)

file(
  GLOB capnp_schemas
  CONFIGURE_DEPENDS
  RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
  "${CMAKE_CURRENT_SOURCE_DIR}/Protos/*.capnp"
)

set(CAPNPC_GEN_DIR "${CMAKE_BINARY_DIR}/gen")
set(CAPNPC_OUTPUT_DIR "${CAPNPC_GEN_DIR}/test-serializer/")
file(MAKE_DIRECTORY ${CAPNPC_OUTPUT_DIR})

capnp_generate_cpp(CAPNP_SRCS CAPNP_HDRS "${capnp_schemas}")
list(APPEND sources ${CAPNP_SRCS})
message(STATUS "includes: ${includes}")
# list(APPEND includes ${CAPNP_HDRS})
message(STATUS "includes: ${CAPNP_HDRS}")

add_library(test-case-serializer SHARED
  ${sources} ${includes}
)


target_include_directories(test-case-serializer PUBLIC "${CAPNPC_GEN_DIR}")
target_include_directories(test-case-serializer SYSTEM
  PUBLIC "include/"
)

target_link_libraries(test-case-serializer PRIVATE caffeine)
set_property(TARGET caffeine PROPERTY POSITION_INDEPENDENT_CODE ON)
target_link_libraries(test-case-serializer PUBLIC
  CapnProto::capnp-rpc
)

