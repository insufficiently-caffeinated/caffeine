
add_executable(caffeine-bin main.cpp)

target_link_libraries(caffeine-bin PRIVATE caffeine)
target_link_libraries(caffeine-bin PRIVATE LLVMIRReader LLVMAnalysis LLVMPasses)

set_target_properties(caffeine-bin
  PROPERTIES
  OUTPUT_NAME caffeine
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
)
