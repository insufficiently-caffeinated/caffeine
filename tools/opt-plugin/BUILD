cc_library(
    name = "opt-plugin",
    srcs = glob(["**/*.cpp"]),
    hdrs = glob(["**/*.h"]),
    strip_include_prefix = "/tools/opt-plugin",
    visibility = ["//visibility:public"],
    deps = [
        "//:caffeine-assert",
        "//third_party:fmt",
        "@llvm//llvm:Passes",
    ],
)
