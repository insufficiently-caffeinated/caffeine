
add_executable(caffeine-bin caffeine.cpp)

target_link_libraries(caffeine-bin PRIVATE caffeine)
target_link_libraries(caffeine-bin PRIVATE LLVMIRReader)
