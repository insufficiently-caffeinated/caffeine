cc_library(
    name = "lmdb",
    srcs = [
        "mdb.c",
        "midl.c",
        "midl.h",
    ],
    hdrs = ["lmdb.h"],
    copts = ["-DMDB_MAXKEYSIZE=2048"],
    visibility = ["//visibility:public"],
)
