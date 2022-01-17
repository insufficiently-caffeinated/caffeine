"""Rules for generating capnproto files.
"""

CapnpInfo = provider(
    "Dependency info for generating capnp files",
    fields = [
        "includes",
        "sources",
    ],
)

def _path_concat(*args):
    path = ""

    for arg in args:
        if path == "":
            path = arg
        elif arg == "":
            pass
        elif arg.startswith("/"):
            path += arg
        else:
            path += "/" + arg

        if path.endswith("/"):
            path = path[:-1]

    return path

def _capnp_path(file):
    if not file.basename.startswith("capnpc-"):
        fail("{} was not a valid capnp plugin".format(file))

    return file.basename[len("capnpc-"):]

def _strip_prefix(path, prefix):
    if not path.startswith(prefix):
        fail("{} was not a prefix of {}".format(prefix, path))

    return path[len(prefix):]

def _gen_capnp(ctx):
    includes = [
        inc
        for dep in ctx.attr.deps
        for inc in dep[CapnpInfo].includes
    ]

    for inc in ctx.attr.includes:
        if inc.startswith("/"):
            includes.append(inc[1:])
        else:
            includes.append(_path_concat(
                ctx.label.workspace_root,
                ctx.label.package,
                inc,
            ))

    inputs = depset(
        ctx.files.srcs + ctx.files.data,
        transitive = [dep[CapnpInfo].sources for dep in ctx.attr.deps],
    )

    args = ctx.actions.args()
    args.add("--verbose")
    args.add("--no-standard-import")
    args.add("-o{}:{}".format(
        "./" + ctx.executable._capnpc_cpp.path,
        ctx.var["GENDIR"],
    ))
    args.add_all(includes, format_each = "-I%s", uniquify = True)
    args.add_all(ctx.files.srcs)

    cwd = _path_concat(
        ctx.label.workspace_root,
        ctx.label.package,
    ) + "/"

    srcs = [
        ctx.actions.declare_file(_strip_prefix(src.path + ".c++", cwd))
        for src in ctx.files.srcs
    ]

    hdrs = [
        ctx.actions.declare_file(_strip_prefix(src.path + ".h", cwd))
        for src in ctx.files.srcs
    ]

    ctx.actions.run(
        outputs = srcs + hdrs,
        inputs = inputs,
        executable = ctx.executable._capnpc,
        arguments = [args],
        tools = [
            ctx.executable._capnpc_cpp,
        ],
        env = {
            "PATH": "./" + ctx.executable._capnpc_cpp.dirname,
        },
        mnemonic = "GenCapnp",
    )

    return [
        OutputGroupInfo(
            srcs = srcs,
            hdrs = hdrs,
        ),
        CapnpInfo(
            includes = includes,
            sources = inputs,
        ),
    ]

capnp_gen = rule(
    implementation = _gen_capnp,
    attrs = {
        "srcs": attr.label_list(allow_files = True, mandatory = True),
        "deps": attr.label_list(providers = [CapnpInfo]),
        "data": attr.label_list(allow_files = True),
        "includes": attr.string_list(),
        "_capnpc": attr.label(
            executable = True,
            cfg = "host",
            default = "@capnproto//:capnpc",
        ),
        "_capnpc_cpp": attr.label(
            executable = True,
            cfg = "host",
            default = "@capnproto//:capnpc-cpp",
        ),
    },
)

# buildifier: disable=function-docstring
def capnp_library(
        name,
        srcs,
        deps = [],
        data = [],
        includes = [],
        builtin_deps = ["@capnproto//:std"],
        **kwargs):
    genargs = {}
    if "visibility" in kwargs:
        genargs.update({"visibility": kwargs["visibility"]})

    _deps = deps + builtin_deps

    if len(srcs) == 0:
        fail("capnp_library requires at least one src")

    capnp_gen(
        name = name + "#capnp",
        srcs = srcs,
        deps = [dep + "#capnp" for dep in _deps],
        data = data,
        includes = includes,
        **genargs
    )

    native.filegroup(
        name = name + "#hdrs",
        srcs = [":{}#capnp".format(name)],
        output_group = "hdrs",
        visibility = ["//visibility:private"],
    )

    native.filegroup(
        name = name + "#srcs",
        srcs = [":{}#capnp".format(name)],
        output_group = "srcs",
        visibility = ["//visibility:private"],
    )

    native.cc_library(
        name = name,
        hdrs = [":{}#hdrs".format(name)],
        srcs = [":{}#srcs".format(name)],
        deps = _deps + [
            "@capnproto//:capnp",
            "@capnproto//:kj",
        ],
        **kwargs
    )

    pass
