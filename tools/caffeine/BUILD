load("//bazel:warnings.bzl", "WARNING_FLAGS")

cc_binary(
    name = "caffeine",
    srcs = ["main.cpp"],
    copts = WARNING_FLAGS,
    visibility = ["//visibility:public"],
    deps = [
        "//:caffeine",
        "@llvm//llvm:IRReader",
        "@llvm//llvm:Support",
    ],
)
