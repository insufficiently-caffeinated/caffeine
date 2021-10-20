#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )/.."


bazel build //tools/compdb
./bazel-bin/tools/compdb/compdb 'deps(//... union @llvm//llvm:all union @llvm//clang:all)' > compile_commands.json
