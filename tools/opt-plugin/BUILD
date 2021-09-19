cc_library(
    name = "opt-plugin-lib",
    srcs = glob(["**/*.cpp"]),
    hdrs = glob(["**/*.h"]),
    strip_include_prefix = "/tools/opt-plugin",
    deps = [
        "//:caffeine-assert",
        "//third_party:fmt",
        "@llvm//llvm:Passes",
    ],
)

filegroup(
    name = "opt-plugin",
    srcs = [":opt-plugin-lib"],
    output_group = "dynamic_library",
    visibility = ["//visibility:public"],
)
