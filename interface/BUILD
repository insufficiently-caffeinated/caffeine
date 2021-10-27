load("@//bazel:bitcode.bzl", "bitcode_library_standalone")

bitcode_library_standalone(
    name = "caffeine",
    hdrs = ["caffeine.h"],
    strip_include_prefix = "/interface",
    visibility = ["//visibility:public"],
)
