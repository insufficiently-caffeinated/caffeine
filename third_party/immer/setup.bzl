"""
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def setup_immer(name):
    git_repository(
        name = name,
        remote = "https://github.com/arximboldi/immer",
        # Release v0.7.0
        commit = "9cb6a5a845df766a4cb3526d8a4584bf99bac8d5",
        shallow_since = "1636392454 +0100"
    )


