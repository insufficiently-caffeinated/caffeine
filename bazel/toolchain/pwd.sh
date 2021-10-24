#!/bin/bash

tree -d .
bazel-out/k8-opt-exec-2B5CBBC6/bin/external/llvm/clang/clang "$@"
