
include(LLVMIRUtils)
include(CaffeineUtils)

function(caffeine_benchmark NAME)
  set(sources "${ARGN}")
  set(target "bench-${NAME}")
  set(out_dir "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/bench-${NAME}.dir")

  llvm_library(${target} ${sources} OUTPUT "${out_dir}/lib.bc")
  llvm_include_directories(${target} PRIVATE "${CMAKE_SOURCE_DIR}/interface")
  llvm_link_libraries     (${target} PRIVATE caffeine-builtins)

  caffeine_custom_command(
    TARGET "gen-${target}" ALL
    OUTPUT "${target}.ll"
    COMMAND "${LLVM_OPT}" ARGS
      -O3
      --internalize
      --internalize-public-api-list main
      --globaldce
      -o "${out_dir}/optimized.bc"
      "$<TARGET_PROPERTY:${target},OUTPUT>"
    COMMAND "${LLVM_DIS}" ARGS "${out_dir}/optimized.bc" -o "${target}.ll"
    COMMENT "Optimizing bench-${NAME}"
    DEPENDS ${target}
  )
endfunction()

caffeine_benchmark(maze          maze.c)
caffeine_benchmark(maze-symbolic maze-symbolic.c)
