load("//bazel:warnings.bzl", "WARNING_FLAGS")

cc_library(
    name = "guided-fuzzing",
    srcs = glob(["src/*.cpp"]),
    hdrs = glob(["include/*.h"]),
    copts = WARNING_FLAGS,
    strip_include_prefix = "/tools/guided-fuzzing/include",
    visibility = ["//visibility:public"],
    deps = [
        "//:caffeine",
        "//third_party:fmt",
        "@afl//:afl-hdrs",
        "@llvm//llvm:Core",
        "@llvm//llvm:IRReader",
    ],
)
