"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_capnproto(name):
    version = "0.9.1"

    http_archive(
        name = name,
        build_file = "@caffeine//third_party/capnp:capnproto.BUILD",
        sha256 = "daf49f794560f715e2f4651c842aaece2d065d4216834c5c3d3254962e35b535",
        strip_prefix = "capnproto-{}".format(version),
        url = "https://github.com/capnproto/capnproto/archive/refs/tags/v{}.tar.gz".format(version),
    )
