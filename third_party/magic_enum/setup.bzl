"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_magic_enum(name):
    version = "0.7.3"

    http_archive(
        name = name,
        url = "https://github.com/Neargye/magic_enum/archive/refs/tags/v{}.tar.gz".format(version),
        strip_prefix = "magic_enum-{}".format(version),
        sha256 = "b8d0cd848546fee136dc1fa4bb021a1e4dc8fe98e44d8c119faa3ef387636bf7",
    )
