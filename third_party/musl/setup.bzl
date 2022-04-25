"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_musl(name):
    date = "2022-04-22-16-42"

    http_archive(
        name = name,
        strip_prefix = "install",
        url = "https://github.com/insufficiently-caffeinated/caffeine-dependencies/releases/download/caffeine-deps-{}/musl.tar.xz".format(date),
        build_file = "@caffeine//third_party/musl:build.bzl",
        sha256 = "9b1ed9802acd9c48934485e6a2e2d0700e68ec568b944472c4a58ad5405e0926",
    )
