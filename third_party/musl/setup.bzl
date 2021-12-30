"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_musl(name):
    date = "2022-01-02-05-51"

    http_archive(
        name = name,
        strip_prefix = "install",
        url = "https://github.com/insufficiently-caffeinated/caffeine-dependencies/releases/download/caffeine-deps-{}/musl.tar.xz".format(date),
        build_file = "@caffeine//third_party/musl:build.bzl",
        sha256 = "4c90f82ae359bb1c17b318ff8808b7fa4e1b948ce72a4449a435b267e9f9cb13",
    )
