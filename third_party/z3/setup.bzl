"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BUILD_FILE_CONTENT = """
cc_import(
    name = "z3-raw",
    static_library = "bin/libz3.a",
    shared_library = "bin/libz3.so",
)

cc_library(
    name = "z3",
    hdrs = glob(["include/**/*"]),
    deps = [":z3-raw"],
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)
"""

def setup_z3(name):
    version = "4.8.14"
    matrix = [
        (
            "windows",
            "https://github.com/Z3Prover/z3/releases/download/z3-{0}/z3-{0}-x64-win.zip",
            "a3fa1edc62d66403008ae01efec2d3499c8f4b730382acbfb3564f82f3ead7a9",
            "z3-{0}-x64-win",
        ),
        (
            "linux",
            "https://github.com/Z3Prover/z3/releases/download/z3-{0}/z3-{0}-x64-glibc-2.31.zip",
            "5ffa4b8b2e04309560d78ef88779bd8353f64248129ca24f6d9e7eb9fdb0af6c",
            "z3-{0}-x64-glibc-2.31",
        ),
        (
            "darwin",
            "https://github.com/Z3Prover/z3/releases/download/z3-{0}/z3-{0}-x64-osx-10.16.zip",
            "",
            "z3-{0}-x64-osx-10.16",
        ),
    ]

    for plat, url, sha256, prefix in matrix:
        http_archive(
            name = "{}-{}".format(name, plat),
            url = url.format(version),
            sha256 = sha256,
            strip_prefix = prefix.format(version),
            build_file_content = BUILD_FILE_CONTENT,
        )
