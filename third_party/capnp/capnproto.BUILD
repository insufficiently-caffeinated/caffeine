load("@//third_party/capnp:capnproto.bzl", "capnp_import_proto")
load("@bazel_skylib//rules:native_binary.bzl", "native_binary")

package(default_visibility = ["//visibility:public"])

capnp_import_proto(
    name = "capnp-std",
    srcs = ["include/capnp/c++.capnp"],
    includes = ["external/capnproto/include"],
)

# cc_import rules cannot have dependencies. In order to properly represent the
# dependencies we have these two private imports for the static libraries and
# then corresponding public cc_library rules that properly model the dependencies.

cc_import(
    name = "raw-capnp",
    static_library = "lib/libcapnp.a",
    visibility = ["//visibility:private"],
)

cc_import(
    name = "raw-capnpc",
    visibility = ["//visibility:private"],
)

cc_import(
    name = "raw-kj",
    static_library = "lib/libkj.a",
    visibility = ["//visibility:private"],
)

cc_library(
    name = "kj",
    hdrs = glob(["include/kj/**/*"]),
    strip_include_prefix = "include",
    deps = [":raw-kj"],
)

cc_library(
    name = "capnp",
    hdrs = glob(["include/capnp/**/*"]),
    strip_include_prefix = "include",
    deps = [
        ":kj",
        ":raw-capnp",
    ],
)

cc_library(
    name = "libcapnpc",
    hdrs = glob(["include/capnp/**/*"]),
    strip_include_prefix = "include",
    deps = [
        ":capnp",
        ":raw-capnpc",
    ],
)

native_binary(
    name = "capnpc",
    src = "tools/capnproto/capnp",
    out = "capnpc",
    data = [":capnpc-c++", ":capnpc-capnp"]
)

native_binary(
    name = "capnpc-c++",
    src = "tools/capnproto/capnpc-c++",
    out = "capnpc-c++",
)

native_binary(
    name = "capnpc-capnp",
    src = "tools/capnproto/capnpc-capnp",
    out = "capnpc-capnp"
)
