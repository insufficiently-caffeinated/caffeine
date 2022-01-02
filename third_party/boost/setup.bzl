"""
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def setup_boost(name):
    if name != "com_github_nelhage_rules_boost":
        fail("boost_rules repo must be named com_github_nelhage_rules_boost")

    git_repository(
        name = name,
        commit = "c8b9b4a75c4301778d2e256b8d72ce47a6c9a1a4",
        remote = "https://github.com/nelhage/rules_boost",
        shallow_since = "1640124117 -0800",
    )
