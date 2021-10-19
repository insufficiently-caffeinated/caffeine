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

def setup_z3(name, version):
    matrix = [
        (
            "windows",
            "https://github.com/Z3Prover/z3/releases/download/z3-{0}/z3-{0}-x64-win.zip",
            "",
            "z3-{0}-x64-win",
        ),
        (
            "linux",
            "https://github.com/Z3Prover/z3/releases/download/z3-{0}/z3-{0}-x64-glibc-2.31.zip",
            "648e8a7afb57445440ad711b733bd675e3888da2767c14ae5122582c924d8d52",
            "z3-{0}-x64-glibc-2.31",
        ),
        (
            "darwin",
            "https://github.com/Z3Prover/z3/releases/download/z3-{0}/z3-{0}-x64-osx-10.15.7.zip",
            "",
            "z3-{0}-x64-osx-10.15.7",
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
