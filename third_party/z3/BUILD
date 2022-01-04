load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

cmake(
    name = "z3",
    build_args = ["-j $(nproc)"],
    generate_args = [
        "-DZ3_BUILD_LIBZ3_SHARED=OFF",
    ],
    lib_source = "@z3-cmake//:srcs",
    out_static_libs = select({
        "@bazel_tools//src/conditions:windows": ["z3.lib"],
        "//conditions:default": ["libz3.a"],
    }),
    visibility = ["//visibility:public"],
)
