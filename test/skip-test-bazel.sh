#!/bin/env bash

SUITE="$1"
TEST="$2"

XML=<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<testsuites>
  <testsuite name="$SUITE">
    <testcase name="$TEST">
      <skipped/>
    </testcase>
  </testsuite>
</testsuites>
EOF

echo "$XML" > "$XML_OUTPUT_FILE"
