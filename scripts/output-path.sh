#!/bin/bash

TARGET="$1"
shift

bazel cquery \
  --output=starlark \
  --starlark:expr="target.files.to_list()[0].path" \
  "'$TARGET'" "$@"
