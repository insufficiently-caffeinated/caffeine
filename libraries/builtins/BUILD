load("@//bazel:bitcode.bzl", "bitcode_library_standalone")

bitcode_library_standalone(
    name = "builtins-impl",
    srcs = glob(
        ["*.c", "*.cpp"],
        exclude = ["threading.c"],
    ),
    hdrs = glob(["*.h"]),
    defines = [
        "CAFFEINE_BAZEL",
    ],
    strip_include_prefix = "/libraries/builtins",
    # Notice the order of libcxx vs libc. libcxx comes
    # first, because it uses `#include_next` directives
    # which require the libc headers to be after the
    # libcxx header includes on the compiler command line
    # invocation. Flipping the two will result in:
    #
    # ```
    # external/libcxx/include/c++/v1/cstddef:44:15: fatal error: 'stddef.h' file not found
    # #include_next <stddef.h>
    # ```
    #
    # and similar nonsense. This is a recurring issue so this warning
    # won't be added everywhere else, but nice to keep in mind
    deps = [
        "@libcxx//:libcxx-hdrs"
    ] + [
        "//interface:caffeine",
        "@musl//:libc-hdrs",
    ],
)

bitcode_library_standalone(
    name = "builtins",
    srcs = [":builtins-impl"],
    visibility = ["//visibility:public"],
)
