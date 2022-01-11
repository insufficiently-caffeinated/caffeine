""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_afl(name):
    version = "3.12"

    http_archive(
        name = "afl",
        url = "https://github.com/AFLplusplus/AFLplusplus/archive/refs/tags/{}c.tar.gz".format(version),
        sha256 = "0240d34a2f99d157063e31d0c2d2801a68bc015e09187d9cc197637ec8fda635",
        strip_prefix = "AFLplusplus-{}c".format(version),
        build_file_content = """
cc_library(
    name = "afl-hdrs",
    hdrs = glob(["include/*.h"]),
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)
        """,
    )
