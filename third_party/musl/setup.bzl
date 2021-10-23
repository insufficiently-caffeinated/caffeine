"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_musl(name):
    date = "2021-10-23-20-04"

    http_archive(
        name = name,
        strip_prefix = "install",
        url = "https://github.com/insufficiently-caffeinated/caffeine-dependencies/releases/download/caffeine-deps-{}/musl.tar.xz".format(date),
        build_file = "@caffeine//third_party/musl:build.bzl",
        sha256 = "5460c5b2bab85863aeb2c402adde0740cbe95564a747c5a2464eaf90e51c3c98",
    )
