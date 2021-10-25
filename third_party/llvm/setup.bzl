"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# buildifier: disable=function-docstring
def setup_llvm(name):
    LLVM_COMMIT = "d7b669b3a30345cfcdb2fde2af6f48aa4b94845d"

    http_archive(
        name = name,
        build_file_content = "# empty",
        strip_prefix = "llvm-project-" + LLVM_COMMIT,
        urls = ["https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT)],
        sha256 = "f09a0d1e4c2c0ec9622964c095105985229ba382e583703dd29cd98593009018",
    )

    http_archive(
        name = "llvm-bazel",
        patches = [
            "//third_party/llvm:clang.patch",
            "//third_party/llvm:llvm.patch",
        ],
        urls = ["https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT)],
        sha256 = "f09a0d1e4c2c0ec9622964c095105985229ba382e583703dd29cd98593009018",
        strip_prefix = "llvm-project-{}/utils/bazel".format(LLVM_COMMIT)
    )

    # native.new_local_repository(
    #     name = name,
    #     build_file_content = "",
    #     path = "/home/swlynch/projects/llvm-project",
    #     workspace_file_content = "",
    # )

    # native.local_repository(
    #     name = "llvm-bazel",
    #     path = "/home/swlynch/projects/llvm-project/utils/bazel",
    # )
