load("//third_party/capnp:capnproto.bzl", "capnp_proto")

protos = glob(["*.capnp"])

out_hdrs = [s + ".h" for s in protos]

out_srcs = [s + ".c++" for s in protos]

capnp_proto(
    name = "caffeine-protos#gen-capnp",
    srcs = protos,
    outs = out_hdrs + out_srcs,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "caffeine-protos",
    srcs = out_srcs,
    hdrs = out_hdrs,
    visibility = ["//visibility:public"],
    include_prefix = "caffeine/Protos",
    deps = [
        "@capnproto//:capnp",
    ],
)
