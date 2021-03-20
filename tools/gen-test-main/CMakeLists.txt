
add_executable(gen-test-main
  main.cpp
)

target_link_libraries(gen-test-main PRIVATE LLVMCore LLVMIRReader LLVMBitWriter LLVMTransformUtils)
target_link_libraries(gen-test-main PRIVATE fmt::fmt)
