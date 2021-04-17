
add_executable(gen-test-main
  main.cpp
)

# The SYSTEM should silence warnings within these headers
target_include_directories(gen-test-main SYSTEM
  PRIVATE "${LLVM_INCLUDE_DIRS}"
  PRIVATE "${FMT_INCLUDE_DIRS}"
)

target_link_libraries(gen-test-main PRIVATE LLVMCore LLVMIRReader LLVMBitWriter LLVMTransformUtils)
target_link_libraries(gen-test-main PRIVATE fmt::fmt)
