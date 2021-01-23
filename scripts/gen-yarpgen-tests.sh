#!/bin/bash

# Change variables here to point to the corresponding programs locally

YARPGEN=yarpgen
COUNT=10

#############################################################

CMAKELISTS_CONTENTS=<< EOM
include(LLVMIRUtils)

file(GLOB sources *.cpp *.h)
get_filename_component(testname "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

add_llvm_ir_library("yarpgen/${testname}" ${sources})

target_include_directories("${test_target}" PRIVATE "$<TARGET_PROPERTY:caffeine-builtins,INCLUDE_DIRECTORIES>")
target_link_libraries     ("${test_target}" PRIVATE caffeine-builtins)
target_compile_options    ("${test_target}" PRIVATE -O3)

add_test(
  NAME "yarpgen/${testname}"
  COMMAND caffeine-bin "$<TARGET_FILE:${test_target}>" main
)
EOM

rm -f CMakeLists.txt
touch CMakeLists.txt

for i in $(seq 0 $COUNT); do
  OUTDIR=yarpgen_$i

  rm -rf "$OUTDIR"
  mkdir "$OUTDIR"
  "$YARPGEN" -o "$OUTDIR"
  cat > "$OUTDIR/CMakeLists.txt" <<- "EOM"
include(LLVMIRUtils)

file(GLOB sources *.cpp *.h)
get_filename_component(testname "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

set(test_target "yarpgen_${testname}")

add_llvm_ir_library("${test_target}" ${sources})

target_include_directories("${test_target}" PRIVATE "$<TARGET_PROPERTY:caffeine-builtins,INCLUDE_DIRECTORIES>")
target_link_libraries     ("${test_target}" PRIVATE caffeine-builtins)
target_compile_options    ("${test_target}" PRIVATE -O3)

add_test(
  NAME "yarpgen/${testname}"
  COMMAND caffeine-bin "$<TARGET_FILE:${test_target}>" main
)
EOM

  echo "add_subdirectory($OUTDIR)" >> CMakeLists.txt
done

