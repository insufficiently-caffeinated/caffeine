
add_executable(gen-builtins
  assert.cpp
  main.cpp
  memcpy.cpp
  memset.cpp
  resolve.cpp
)

target_include_directories(gen-builtins SYSTEM
  PRIVATE "${LLVM_INCLUDE_DIRS}"
  PRIVATE "${FMT_INCLUDE_DIRS}"
)

target_link_libraries(gen-builtins PRIVATE LLVMCore LLVMIRReader LLVMBitWriter)
target_link_libraries(gen-builtins PRIVATE fmt::fmt)
target_link_libraries(gen-builtins PRIVATE caffeine-assert)

