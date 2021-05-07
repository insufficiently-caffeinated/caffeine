
llvm_library(bench-maze maze.c)
llvm_include_directories(bench-maze PRIVATE "${CMAKE_SOURCE_DIR}/interface")
llvm_link_libraries     (bench-maze PRIVATE caffeine-builtins)
