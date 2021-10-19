load("@caffeine//third_party/capnp:capnproto.bzl", "capnp_gen", "capnp_library")

package(default_visibility = ["//visibility:public"])

KJ_SRCS = [
    "array.c++",
    "list.c++",
    "common.c++",
    "debug.c++",
    "exception.c++",
    "io.c++",
    "memory.c++",
    "mutex.c++",
    "string.c++",
    "source-location.c++",
    "hash.c++",
    "table.c++",
    "thread.c++",
    "main.c++",
    "arena.c++",
    "test-helpers.c++",
    "units.c++",
    "encoding.c++",
    "refcount.c++",
    "string-tree.c++",
    "time.c++",
    "filesystem.c++",
    "filesystem-disk-unix.c++",
    "filesystem-disk-win32.c++",
    "parse/char.c++",
]

CAPNP_SRCS = [
    "c++.capnp.c++",
    "blob.c++",
    "arena.c++",
    "layout.c++",
    "list.c++",
    "any.c++",
    "message.c++",
    "schema.capnp.c++",
    "stream.capnp.c++",
    "serialize.c++",
    "serialize-packed.c++",
    "schema.c++",
    "schema-loader.c++",
    "dynamic.c++",
    "stringify.c++",
]

CAPNPC_SRCS = [
    "compiler/type-id.c++",
    "compiler/error-reporter.c++",
    "compiler/lexer.capnp.c++",
    "compiler/lexer.c++",
    "compiler/grammar.capnp.c++",
    "compiler/parser.c++",
    "compiler/generics.c++",
    "compiler/node-translator.c++",
    "compiler/compiler.c++",
    "schema-parser.c++",
    "serialize-text.c++",
]

CAPNP_RPC_SRCS = [
    "serialize-async.c++",
    "capability.c++",
    "membrane.c++",
    "dynamic-capability.c++",
    "rpc.c++",
    "rpc.capnp.c++",
    "rpc-twoparty.c++",
    "rpc-twoparty.capnp.c++",
    "persistent.capnp.c++",
    "ez-rpc.c++",
]

CAPNP_JSON_SRCS = [
    "compat/json.c++",
    "compat/json.capnp.c++",
]

CAPNP_WEBSOCKET_SRCS = [
    "compat/websocket-rpc.c++",
]

WARNINGS = [
    "-Wno-sign-compare",
    "-Wno-strict-aliasing",
    "-Wno-maybe-uninitialized",
    "-Wno-unknown-warning-option",
]

cc_library(
    name = "kj",
    srcs = ["c++/src/kj/" + src for src in KJ_SRCS],
    hdrs = glob(["c++/src/kj/**/*.h"]),
    copts = WARNINGS,
    strip_include_prefix = "c++/src",
)

cc_library(
    name = "capnp",
    srcs = ["c++/src/capnp/" + src for src in CAPNP_SRCS],
    hdrs = glob(["c++/src/capnp/**/*.h"]),
    copts = WARNINGS,
    strip_include_prefix = "c++/src",
    deps = [":kj"],
)

cc_library(
    name = "capnp-rpc",
    srcs = ["c++/src/capnp/" + src for src in CAPNP_RPC_SRCS],
    copts = WARNINGS,
    strip_include_prefix = "c++/src",
    deps = [
        ":capnp",
        ":kj",
    ],
)

cc_library(
    name = "capnp-json",
    srcs = ["c++/src/capnp/" + src for src in CAPNP_JSON_SRCS],
    copts = WARNINGS,
    strip_include_prefix = "c++/src",
    deps = [
        ":capnp",
        ":kj",
    ],
)

cc_library(
    name = "capnp-websocket",
    srcs = ["c++/src/capnp/" + src for src in CAPNP_WEBSOCKET_SRCS],
    copts = WARNINGS,
    strip_include_prefix = "c++/src",
    deps = [
        ":capnp",
        ":kj",
    ],
)

cc_library(
    name = "libcapnpc",
    srcs = ["c++/src/capnp/" + src for src in CAPNPC_SRCS],
    copts = WARNINGS,
    strip_include_prefix = "c++/src",
    deps = [
        ":capnp",
        ":kj",
    ],
)

cc_binary(
    name = "capnpc",
    srcs = [
        "c++/src/capnp/compiler/capnp.c++",
        "c++/src/capnp/compiler/module-loader.c++",
    ],
    copts = WARNINGS,
    deps = [
        ":capnp",
        ":capnp-json",
        ":kj",
        ":libcapnpc",
    ],
)

cc_binary(
    name = "capnpc-capnp",
    srcs = ["c++/src/capnp/compiler/capnpc-capnp.c++"],
    copts = WARNINGS,
    deps = [
        ":capnp",
        ":kj",
    ],
)

cc_binary(
    name = "capnpc-cpp",
    srcs = ["c++/src/capnp/compiler/capnpc-c++.c++"],
    copts = WARNINGS,
    deps = [
        ":capnp",
        ":kj",
    ],
)

capnp_gen(
    name = "std#capnp",
    srcs = glob(
        ["c++/src/capnp/**/*.capnp"],
        exclude = [
            "c++/src/capnp/test.capnp",
        ],
    ),
    includes = ["c++/src"],
)

cc_library(
    name = "std",
    deps = [
        ":capnp",
        ":kj",
    ],
)

capnp_library(
    name = "test",
    srcs = ["c++/src/capnp/test.capnp"],
    data = [
        "c++/src/capnp/testdata/binary",
        "c++/src/capnp/testdata/packed",
        "c++/src/capnp/testdata/short.txt",
    ],
    includes = ["c++/src"],
)
