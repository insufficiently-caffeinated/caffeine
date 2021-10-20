"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_llvm(name):
    LLVM_COMMIT = "15e9575fb5988a66aa6e57a55818b54b575dd795"

    http_archive(
        name = name,
        build_file_content = "# empty",
        patches = [
            "//third_party/llvm:clang.patch",
            "//third_party/llvm:llvm.patch",
        ],
        sha256 = "b440ecccc625915fd4c8dc69d1bed620ed996e60563dbbfa35279c31fd036d5d",
        strip_prefix = "llvm-project-" + LLVM_COMMIT,
        urls = ["https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT)],
    )
