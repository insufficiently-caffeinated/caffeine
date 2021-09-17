cc_library(
    name = "divine",
    srcs = glob(["include/**/*.cpp"]),
    hdrs = glob(["include/**/*"]),
    deps = [
        "//third_party:fmt",
        "@llvm//llvm:BitWriter",
        "@llvm//llvm:Core",
        "@llvm//llvm:IRReader",
        "@llvm//llvm:TransformUtils",
    ],
    visibility = ["//visibility:public"],
    strip_include_prefix = "//third_party/divine/include",
)
