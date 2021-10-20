"""
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def setup_boost(name):
    if name != "com_github_nelhage_rules_boost":
        fail("boost_rules repo must be named com_github_nelhage_rules_boost")

    git_repository(
        name = name,
        commit = "fce83babe3f6287bccb45d2df013a309fa3194b8",
        remote = "https://github.com/nelhage/rules_boost",
        shallow_since = "1630079166 -0700",
    )
