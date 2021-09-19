"""
"""

load("@bazel_skylib//lib:sets.bzl", "sets")

CapnpInfo = provider(
    "Information needed by capnp rule dependencies",
    fields = ["includes", "inputs"],
)

def _label_to_string(ctx, label):
    return ctx.expand_location(
        "$(location @{}//{}:{})".format(
            label.workspace_name,
            label.package,
            label.name,
        ),
    )

def _capnp_import_proto(ctx):
    includes = sets.make(ctx.attr.includes)
    inputs = depset(
        ctx.files.srcs + ctx.files.data,
        transitive = [tgt[CapnpInfo].inputs for tgt in ctx.attr.deps] +
                     [ctx.attr.capnp_std[CapnpInfo].inputs] if ctx.attr.capnp_std else [],
    )

    for dep_target in ctx.attr.deps:
        includes = sets.union(includes, dep_target.capnp.includes)
    if ctx.attr.capnp_std:
        includes = sets.union(includes, ctx.attr.capnp_std[CapnpInfo].includes)

    return [
        CapnpInfo(
            includes = includes,
            inputs = inputs,
        ),
    ]

capnp_import_proto = rule(
    implementation = _capnp_import_proto,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "deps": attr.label_list(providers = ["capnp"]),
        "data": attr.label_list(allow_files = True),
        "includes": attr.string_list(),
        "capnp_std": attr.label(),
    },
)

def _capnp_proto(ctx):
    result = _capnp_import_proto(ctx)

    includes = result[0].includes
    inputs = depset(
        [ctx.executable.capnpc_cxx],
        transitive = [
            result[0].inputs,
        ],
    )

    args = ctx.actions.args()
    args.add("--verbose")
    args.add("--no-standard-import")
    args.add("-o{}:{}".format(
        ctx.executable.capnpc_cxx.path,
        ctx.var["GENDIR"],
    ))
    args.add_all(["-I" + inc for inc in sets.to_list(includes)])
    args.add_all(ctx.files.srcs)

    ctx.actions.run(
        inputs = inputs,
        outputs = ctx.outputs.outs,
        executable = ctx.executable.capnpc,
        arguments = [args],
        mnemonic = "GenCapnp",
    )

    return result

capnp_proto = rule(
    implementation = _capnp_proto,
    output_to_genfiles = True,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "deps": attr.label_list(providers = [CapnpInfo]),
        "data": attr.label_list(allow_files = True),
        "includes": attr.string_list(),
        "outs": attr.output_list(),
        "capnp_std": attr.label(default = Label("@capnproto//:capnp-std")),
        "capnpc": attr.label(
            default = Label("@capnproto//:capnpc"),
            executable = True,
            cfg = "host",
        ),
        "capnpc_cxx": attr.label(
            default = Label("@capnproto//:capnpc-c++"),
            executable = True,
            cfg = "host",
        ),
    },
)

def cc_capnp_library(
        name,
        srcs = [],
        deps = [],
        data = [],
        includes = [],
        **kwargs):
    """Bazel rule to create a C++ capnproto library from capnp source files.

    Args:
      name: Name of the generated library
      srcs: CapnProto sources to compile
      deps: todo
      data: todo
      includes: todo
      **kwargs: extra arguments that are passed on to cc_library
    """

    out_hdrs = [s + ".h" for s in srcs]
    out_srcs = [s + ".c++" for s in srcs]

    capnp_proto(
        name = name + "#gen-capnp",
        outs = out_hdrs + out_srcs,
        srcs = srcs,
        deps = [s + "#gen-capnp" for s in deps],
        data = data,
        includes = includes,
        visibility = ["//visibility:public"],
    )

    native.cc_library(
        name = name,
        hdrs = out_hdrs,
        srcs = out_srcs,
        deps = ["@capnproto//:capnp", name + "#gen-capnp"] + deps,
        includes = includes,
        **kwargs
    )
