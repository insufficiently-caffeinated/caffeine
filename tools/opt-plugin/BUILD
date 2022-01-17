load("//bazel:warnings.bzl", "WARNING_FLAGS")

cc_binary(
    name = "opt-plugin",
    srcs = glob([
        "**/*.cpp",
        "**/*.h",
    ]),
    copts = ["-Itools/opt-plugin"] + WARNING_FLAGS,
    linkshared = True,
    tags = ["manual"],
    visibility = ["//visibility:public"],
    deps = [
        "//:caffeine-assert",
        "//third_party:fmt",
        "@llvm//llvm:headers",
    ],
)
