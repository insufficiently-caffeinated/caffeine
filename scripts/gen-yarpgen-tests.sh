#!/bin/bash

# Change variables here to point to the corresponding programs locally

YARPGEN=${YARPGEN:-yarpgen}
COUNT=${COUNT:-10}

#############################################################

rm -f CMakeLists.txt
touch CMakeLists.txt

for i in $(seq 0 $COUNT); do
  OUTDIR=./yarpgen_$i

  rm -rf "$OUTDIR"
  mkdir "$OUTDIR"
  "$YARPGEN" -o "$OUTDIR"

  clang++ "$OUTDIR/driver.cpp" "$OUTDIR/func.cpp" "-I$OUTDIR" -o "$OUTDIR/prog"
  seed=$("$OUTDIR/prog")
  rm "$OUTDIR/prog"

  sed -i '1s;^;#include "caffeine.h"\n;' "$OUTDIR/driver.cpp"
  sed -i "s;printf[(].*[)];caffeine_assert(seed == $seed);g" "$OUTDIR/driver.cpp"

  cat > "$OUTDIR/CMakeLists.txt" <<- "EOM"
include(CaffeineTestUtils)

file(GLOB sources *.cpp *.h)
get_filename_component(testname "${CMAKE_CURRENT_SOURCE_DIR}" NAME)

llvm_library("yarpgen-${testname}" ${sources} OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/yarpgen.ll")

add_dependencies        ("yarpgen-${testname}" caffeine-builtins)
llvm_include_directories("yarpgen-${testname}" PRIVATE "$<TARGET_PROPERTY:caffeine-builtins,INCLUDE_DIRECTORIES>")
llvm_link_libraries     ("yarpgen-${testname}" PRIVATE caffeine-builtins)
llvm_compile_options    ("yarpgen-${testname}" PRIVATE -O3 -w)

add_test(
  NAME "yarpgen/${testname}"
  COMMAND caffeine-bin "${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_PROPERTY:yarpgen-${testname},OUTPUT>" main
)
EOM

  echo "add_subdirectory($OUTDIR)" >> CMakeLists.txt
done

