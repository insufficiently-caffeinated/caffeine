"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_z3(name):
    version = "4.8.14"

    http_archive(
        name = "{}".format(name),
        url = "https://github.com/Z3Prover/z3/archive/refs/tags/z3-{}.tar.gz".format(version),
        sha256 = "96a1f49a7701120cc38bfa63c02ff93be4d64c7926cea41977dedec7d87a1364",
        strip_prefix = "z3-z3-{}".format(version),
#         build_file_content = """
# filegroup(
#     name = "srcs",
#     srcs = glob(["**"]),
#     visibility = ["//visibility:public"]
# )
# """
        build_file = "//third_party/z3:build.bzl",
        patches = [
            "//third_party/z3:z3.patch"
        ]
    )
