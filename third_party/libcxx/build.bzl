"""
"""

load("@caffeine//bazel:bitcode.bzl", "bitcode_import", "bitcode_optimize")

headers = glob(["include/c++/v1/**"])

cc_library(
    name = "libcxx-hdrs-impl",
    hdrs = headers,
    deps = ["@musl//:libc-hdrs-impl"],
    includes = ["include/c++/v1"]
)

bitcode_import(
    name = "libcxx-hdrs",
    dep = ":libcxx-hdrs-impl",
    visibility = ["//visibility:public"],
)

STRIP_FUNCTIONS = []

bitcode_optimize(
    name = "libcxx-opt",
    src = "lib/libcxx.bc",
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
    name = "libcxx",
    dep = ":libcxx-hdrs-impl",
    bitcode = ":libcxx-opt",
    visibility = ["//visibility:public"],
)
