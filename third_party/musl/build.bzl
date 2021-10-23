"""
"""

load("@caffeine//bazel:bitcode.bzl", "bitcode_import")

cc_library(
    name = "libc-hdrs",
    hdrs = glob(["include/**/*.h"]),
    includes = ["include"],
    include_prefix = "__musl_internal",
)

bitcode_import(
    name = "libc",
    dep = ":libc-hdrs",
    bitcode = "lib/libc.bc",
    visibility = ["//visibility:public"]
)
