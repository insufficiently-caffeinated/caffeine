#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )/.."


bazel build //tools/compdb
./bazel-bin/tools/compdb/compdb > compile_commands.json
