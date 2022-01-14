"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_libcxx(name):
    version = "v0.0.39"

    http_archive(
        name = name,
        strip_prefix = "build/libcxx",
        url = "https://github.com/insufficiently-caffeinated/libcxx/releases/download/{}/libcxx.tar.gz".format(version),
        build_file = "@caffeine//third_party/libcxx:build.bzl",
        sha256 = "566979f706e309c8af7b948eaad1974668cea2754fa0b6ab3cb65474bd25553a",
    )
