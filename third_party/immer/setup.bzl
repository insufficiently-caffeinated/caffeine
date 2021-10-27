"""
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def setup_immer(name):
    git_repository(
        name = name,
        remote = "https://github.com/arximboldi/immer",
        commit = "2eea2202b5b71b58d18cc4672a5d995397a9797b",
        shallow_since = "1633428364 +0200"
    )


