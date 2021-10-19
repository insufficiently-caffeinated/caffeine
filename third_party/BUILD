package(default_visibility = ["//visibility:public"])

alias(
    name = "fmt",
    actual = "@fmt//:fmt",
)

alias(
    name = "immer",
    actual = "@immer//:immer",
)

alias(
    name = "z3",
    actual = select({
        "@bazel_tools//src/conditions:windows": "@z3-windows//:z3",
        "@bazel_tools//src/conditions:darwin": "@z3-darwin//:z3",
        "//conditions:default": "@z3-linux//:z3",
    }),
)

alias(
    name = "magic-enum",
    actual = "@magic-enum//:magic_enum",
)

alias(
    name = "hopscotch-map",
    actual = "@tsl//:hopscotch-map",
)

alias(
    name = "gtest",
    actual = "@googletest//:gtest",
)

alias(
    name = "gtest_main",
    actual = "@googletest//:gtest_main",
)

alias(
    name = "clang",
    actual = "@llvm//clang",
)
