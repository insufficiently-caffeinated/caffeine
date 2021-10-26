cc_binary(
    name = "compdb",
    srcs = glob([
        "*.cpp",
        "*.h",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:algorithm",
        "@boost//:json",
        "@boost//:process",
        "@llvm//llvm:Support",
    ],
)
