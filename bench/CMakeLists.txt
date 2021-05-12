
include(LLVMIRUtils)

function(caffeine_benchmark NAME)
  set(sources "${ARGN}")
  set(target "bench-${NAME}")
  set(out_dir "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/bench-${NAME}.dir")

  llvm_library(${target} ${sources} OUTPUT "${out_dir}/lib.bc")
  llvm_include_directories(${target} PRIVATE "${CMAKE_SOURCE_DIR}/interface")
  llvm_link_libraries     (${target} PRIVATE caffeine-builtins)

  add_custom_command(
    OUTPUT "${target}.ll"
    MAIN_DEPENDENCY "${out_dir}/lib.bc"
    COMMAND "${LLVM_OPT}" ARGS
      -O3
      --internalize
      --internalize-public-api-list main
      --globaldce
      -o "${out_dir}/optimized.bc"
      "${out_dir}/lib.bc"
    COMMAND "${LLVM_DIS}" ARGS "${out_dir}/optimized.bc" -o "${target}.ll"
    COMMENT "Optimizing bench-${NAME}"
  )

  add_custom_target("gen-${target}" ALL DEPENDS "${target}.ll")
endfunction()

caffeine_benchmark(maze          maze.c)
caffeine_benchmark(maze-symbolic maze-symbolic.c)
