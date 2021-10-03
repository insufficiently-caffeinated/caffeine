load("@//bazel:bitcode.bzl", "bitcode_library")

bitcode_library(
    name = "builtins",
    srcs = glob(["*.c", "*.h"]),
    copts = ["-Ilibraries/builtins", "-lpthread"],
    deps = ["//interface:caffeine"],
    visibility = ["//visibility:public"],
)
