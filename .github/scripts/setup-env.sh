#!/usr/bin/env bash

# This script is meant to simplify the compilation matrix in the case where we have
# multiple dependent definitions

error() {
  echo "$1" >&2
}

while [[ $# -gt 0 ]]; do
  case $1 in
    --compiler)
      COMPILER="$2"
      break
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
    ;;
  gcc)
    export CC=gcc
    export CXX=g++
    ;;
esac
