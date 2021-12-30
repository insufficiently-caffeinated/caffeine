"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_musl(name):
    date = "2021-12-29-03-25"

    http_archive(
        name = name,
        strip_prefix = "install",
        url = "https://github.com/insufficiently-caffeinated/caffeine-dependencies/releases/download/caffeine-deps-{}/musl.tar.xz".format(date),
        build_file = "@caffeine//third_party/musl:build.bzl",
        sha256 = "d922f7093f20615293d5ab173651e15d202bc637ab947b12a18bf0ef6a7fd8da",
    )
