load("@//bazel:bitcode.bzl", "bitcode_library_standalone")

bitcode_library_standalone(
    name = "builtins-impl",
    srcs = glob(
        ["*.c"],
        exclude = ["threading.c"],
    ),
    hdrs = glob(["*.h"]),
    defines = [
        "CAFFEINE_BAZEL",
    ],
    strip_include_prefix = "/libraries/builtins",
    deps = [
        "//interface:caffeine",
        "@musl//:libc-hdrs",
    ],
)

bitcode_library_standalone(
    name = "builtins",
    srcs = [":builtins-impl"],
    visibility = ["//visibility:public"],
)
