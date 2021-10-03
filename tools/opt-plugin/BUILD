cc_binary(
    name = "llvm-passes",
    deps = [
        "@llvm//llvm:Passes",
    ],
    linkshared = True
)

cc_binary(
    name = "opt-plugin",
    srcs = glob(["**/*.cpp", "**/*.h"]),
    copts = [
        "-Itools/opt-plugin", 
    ],
    linkshared = True,
    deps = [
        "//:caffeine-assert",
        "//third_party:fmt",
        "@llvm//llvm:headers"
    ],
    tags = ["local"],
    visibility = ["//visibility:public"]
)
