cc_library(
    name = "divine",
    srcs = glob(["src/**/*.cpp"]),
    hdrs = glob(["include/**/*"]),
    strip_include_prefix = "/third_party/divine/include",
    visibility = ["//visibility:public"],
    deps = [
        "//third_party:fmt",
        "@llvm//llvm:BitWriter",
        "@llvm//llvm:Core",
        "@llvm//llvm:IRReader",
        "@llvm//llvm:TransformUtils",
    ],
)
