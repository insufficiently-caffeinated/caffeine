load("@//bazel:bitcode.bzl", "bitcode_library_standalone")

exports_files(["caffeine.h"])

bitcode_library_standalone(
    name = "caffeine",
    hdrs = ["caffeine.h"],
    strip_include_prefix = "/interface",
    visibility = ["//visibility:public"],
)
