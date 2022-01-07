"""
"""

load("@caffeine//bazel:bitcode.bzl", "bitcode_import", "bitcode_optimize")

cc_library(
    name = "libc-hdrs-impl",
    hdrs = glob(["include/**/*.h"]),
    includes = ["include"],
    # libcxx depends on libc
    visibility = ["@libcxx//:__subpackages__"],
)

bitcode_import(
    name = "libc-hdrs",
    dep = ":libc-hdrs-impl",
    visibility = ["//visibility:public"],
)

STRIP_FUNCTIONS = [
    "abort",
    "calloc",
    "malloc",
    "free",
    "posix_memalign",
]

bitcode_optimize(
    name = "libc-opt",
    src = "lib/libc.bc",
    args = [
        "--caffeine-strip-functions",
        "--globaldce",
        "--mtriple=x86_64-unknown-linux-gnu",
    ] + [
        arg
        for func in STRIP_FUNCTIONS
        for arg in ["--strip-function", func]
    ],
)

bitcode_import(
    name = "libc",
    dep = ":libc-hdrs-impl",
    bitcode = ":libc-opt",
    visibility = ["//visibility:public"],
)
