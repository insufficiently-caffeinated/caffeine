""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_lmdb(name):
    version = "0.9.29"

    http_archive(
        name = name,
        build_file = "@caffeine//third_party/lmdb:lmdb.BUILD",
        strip_prefix = "lmdb-LMDB_{}/libraries/liblmdb".format(version),
        url = "https://github.com/LMDB/lmdb/archive/refs/tags/LMDB_{}.tar.gz".format(version),
        sha256 = "22054926b426c66d8f2bc22071365df6e35f3aacf19ad943bc6167d4cae3bebb",
    )
