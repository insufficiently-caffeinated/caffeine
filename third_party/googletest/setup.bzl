"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_googletest(name):
    http_archive(
        name = name,
        urls = ["https://github.com/google/googletest/archive/e2239ee6043f73722e7aa812a459f54a28552929.zip"],
        strip_prefix = "googletest-e2239ee6043f73722e7aa812a459f54a28552929",
        sha256 = "8daa1a71395892f7c1ec5f7cb5b099a02e606be720d62f1a6a98f8f8898ec826",
    )
