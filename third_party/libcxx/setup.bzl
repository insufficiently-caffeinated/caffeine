"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_libcxx(name):
    version = "v0.0.34"

    http_archive(
        name = name,
        strip_prefix = "build/libcxx",
        url = "https://github.com/insufficiently-caffeinated/libcxx/releases/download/{}/libcxx.tar.gz".format(version),
        build_file = "@caffeine//third_party/libcxx:build.bzl",
        sha256 = "3df931bc57e52a6a76d203406b581403dcc1324dac70f7af45a65f463f520ace",
    )
