load("@//bazel:bitcode.bzl", "bitcode_library_standalone")

bitcode_library_standalone(
    name = "builtins",
    srcs = glob(["*.c", "*.h"]),
    copts = ["-Ilibraries/builtins"],
    deps = ["//interface:caffeine"],
    visibility = ["//visibility:public"],
)
