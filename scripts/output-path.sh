#!/bin/bash

TARGET="$1"
shift

bazel cquery \
  --output=starlark \
  --starlark:expr="target.files.to_list()[0].path" \
  "'$TARGET'" "$@" 2> bazel-out/query.log

if [ $? -ne 0 ]; then
  cat bazel-out/query.log 1>&2
fi

rm bazel-out/query.log
