#!/bin/sh

# This script is meant to simplify the compilation matrix in the case where we have
# multiple dependent definitions

error() {
  echo "$1" >&2
}

while [[ $# -gt 0 ]]; do
  case $1 in
    --compiler)
      COMPILER="$2"
      ;;
    *)
      error "Unknown option '$1'"
      exit 1
      ;;
  esac
done

case $COMPILER in
  clang)
    export CC=clang
    export CXX=clang++
    # enable coverage in clang
    export CXXFLAGS="-fprofile-instr-generate -fcoverage-mapping -g -O0"
    export LDFLAGS="-fprofile-instr-generate -fcoverage-mapping"
    ;;
  gcc)
    export CC=gcc
    export CXX=g++
    ;;
esac
