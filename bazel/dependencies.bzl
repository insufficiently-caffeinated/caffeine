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

def googletest():
    http_archive(
        name = "googletest",
        urls = ["https://github.com/google/googletest/archive/e2239ee6043f73722e7aa812a459f54a28552929.zip"],
        strip_prefix = "googletest-e2239ee6043f73722e7aa812a459f54a28552929",
        sha256 = "8daa1a71395892f7c1ec5f7cb5b099a02e606be720d62f1a6a98f8f8898ec826",
    )

def hopscotch_map():
    new_git_repository(
        name = "tsl",
        commit = "29030f55ca518bb1be5113ab0a8e134772024a9d",
        remote = "https://github.com/Tessil/hopscotch-map",
        shallow_since = "1592802410 +0100",
        build_file_content = """
cc_library(
    name = "hopscotch-map",
    hdrs = glob(["include/**/*.h"]),
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)
""",
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

def rules_foreign_cc():
    http_archive(
        name = "rules_foreign_cc",
        sha256 = "33a5690733c5cc2ede39cb62ebf89e751f2448e27f20c8b2fbbc7d136b166804",
        strip_prefix = "rules_foreign_cc-0.5.1",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.5.1.tar.gz",
    )

def caffeine_dependencies():
    """Load all dependencies for caffeine
    """

    skylib()
    rules_foreign_cc()
    googletest()
    hopscotch_map()
    afl()
