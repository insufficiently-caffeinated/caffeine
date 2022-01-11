"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def skylib():
    SKYLIB_VERSION = "1.0.3"

    http_archive(
        name = "bazel_skylib",
        sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{version}/bazel-skylib-{version}.tar.gz".format(version = SKYLIB_VERSION),
            "https://github.com/bazelbuild/bazel-skylib/releases/download/{version}/bazel-skylib-{version}.tar.gz".format(version = SKYLIB_VERSION),
        ],
    )

def afl():
    new_git_repository(
        name = "afl",
        remote = "https://github.com/AFLplusplus/AFLplusplus",
        # tag = "3.12c",
        commit = "2dac4e785fa9f27e8c59bb504cfa8942eba938be",
        shallow_since = "1616581381 +0100",
        build_file_content = """
cc_library(
    name = "afl-hdrs",
    hdrs = glob(["include/*.h"]),
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)
        """,
    )

def caffeine_dependencies():
    """Load all dependencies for caffeine
    """

    skylib()
    afl()
