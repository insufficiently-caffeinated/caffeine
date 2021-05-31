#!/bin/bash

# Change variables here to point to the corresponding programs locally

YARPGEN=${YARPGEN:-yarpgen}
COUNT=${COUNT:-10}
DIR=${DIR:-.}

function stderr {
  echo "$@" 1>&2
}

function print_help {
  stderr "USAGE: gen-yarpgen-tests.sh [OPTIONS]"
  stderr "Generates a series of symbolic test cases using yarpgen."
  stderr ""
  stderr "Options:"
  stderr "  -n, --count <count>   set the number of test cases to generate [default = 10]"
  stderr "  -o, --output <dir>    the directory the test cases will be generated in [default = .]"
  stderr "      --yarpgen <path>  path to the yarpgen executable. Overrides the YARPGEN"
  stderr "                        environment variable if specified [default = yarpgen]"
  stderr "  -h, --help            display this help and exit"
}

while [[ $# -gt 0 ]]; do
  key="$1"
  shift

  case "$key" in
  -h|--help)
    print_help
    exit 0
    ;;
  --yarpgen)
    YARPGEN="$1"
    shift
    ;;
  -n|--count)
    COUNT="$1"
    shift
    ;;
  -o|--output)
    DIR="$1"
    shift
    ;;
  *)
    stderr "Unknown argument '$key'"
    print_help
    exit 1
    ;;
  esac
done

#############################################################

mkdir -p "$DIR"
rm -f "$DIR/CMakeLists.txt"
touch "$DIR/CMakeLists.txt"

for i in $(seq 0 $COUNT); do
  OUTDIR="$DIR/yarpgen_$i"

  rm -rf "$OUTDIR"
  mkdir "$OUTDIR"
  "$YARPGEN" -o "$OUTDIR"

  clang++ -O1 -w "$OUTDIR/driver.cpp" "$OUTDIR/func.cpp" "-I$OUTDIR" -o "$OUTDIR/prog"
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
  COMMAND caffeine-bin "$<TARGET_PROPERTY:yarpgen-${testname},OUTPUT>"
)
EOM

  echo "add_subdirectory(yarpgen_$i)" >> "$DIR/CMakeLists.txt"
done

