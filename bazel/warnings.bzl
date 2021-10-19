"""
"""

load("@bazel_skylib//lib:selects.bzl", "selects")

WARNING_FLAGS = selects.with_or({
    ("@bazel_tools//tools/cpp:clang", "@bazel_tools//tools/cpp:clang-cl"): [
        "--system-header-prefix=llvm/",
        "--system-header-prefix=fmt/",
        "-fcolor-diagnostics",
        "-Wall",
        "-Wextra",
        "-Wno-unknown-pragmas",
    ],
    "@bazel_tools//tools/cpp:gcc": [
        "-fdiagnostics-color=always",
        "-Wall",
        "-Wextra",
        "-Wno-unknown-pragmas",
    ],
    "@bazel_tools//tools/cpp:msvc": [
        "/experimental:external",
        "/external:anglebrackets",
        "/external:W0",
        "/W3",
        "-D_SILENCE_ALL_CXX17_DEPRECATION_WARNINGS=1",
    ],
    "//conditions:default": [],
})
