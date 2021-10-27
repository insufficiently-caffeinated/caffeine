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

    commit = "a2f52e1177b87bdc747f8d0b7745c8f967bceb9d"

    # Used internally by googletest in some configurations
    # We never actually compile this but it's needed to run some bazel queries occasionally
    http_archive(
        name = "com_google_absl",
        urls = ["https://github.com/abseil/abseil-cpp/archive/{}.zip".format(commit)],
        strip_prefix = "abseil-cpp-{}".format(commit),
        sha256 = "0340e6eb4954fa7218f6be7546ff2b9d4eac1eeb76890bd292a3b2b25731332c",
    )
