""

def _pyg2hpp_impl(ctx):
    args = ctx.actions.args()
    args.add(ctx.file.src)
    args.add(ctx.outputs.out.dirname)

    ctx.actions.run(
        inputs = [ctx.file.src],
        outputs = [ctx.outputs.out],
        executable = ctx.executable._pyg2hpp,
        arguments = [args],
        mnemonic = "Pyg2Hpp",
    )

pyg2hpp = rule(
    implementation = _pyg2hpp_impl,
    attrs = {
        "src": attr.label(allow_single_file = [".pyg"]),
        "out": attr.output(),
        "_pyg2hpp": attr.label(
            default = "@z3//:pyg2hpp",
            executable = True,
            cfg = "exec",
        ),
    },
)

def _mem_initializer_impl(ctx):
    out = ctx.actions.declare_file("mem_initializer.cpp")

    args = ctx.actions.args()
    args.add(out.dirname)
    args.add_all(ctx.files.srcs)

    ctx.actions.run(
        inputs = ctx.files.srcs,
        outputs = [out],
        executable = ctx.executable._mk_mem_initializer,
        arguments = [args],
        mnemonic = "Z3MkMemInitializer",
    )

    return [DefaultInfo(files = depset([out]))]

mem_initializer = rule(
    implementation = _mem_initializer_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".h", ".hpp"]),
        "_mk_mem_initializer": attr.label(
            default = "@z3//:mk_mem_initializer_cpp",
            executable = True,
            cfg = "exec",
        ),
    },
)

def _gen_api_impl(ctx):
    f1 = ctx.actions.declare_file("api_commands.cpp", sibling = ctx.outputs.out)
    f2 = ctx.actions.declare_file("api_log_macros.cpp", sibling = ctx.outputs.out)

    args = ctx.actions.args()
    args.add_all(ctx.files.hdrs)
    args.add("--api_output_dir")
    args.add(ctx.outputs.out.dirname)

    ctx.actions.run(
        inputs = ctx.files.hdrs,
        outputs = [f1, f2, ctx.outputs.out],
        executable = ctx.executable._update_api,
        arguments = [args],
        mnemonic = "UpdateAPI",
    )

    return [DefaultInfo(files = depset([f1, f2, ctx.outputs.out]))]

gen_api = rule(
    implementation = _gen_api_impl,
    attrs = {
        "hdrs": attr.label_list(allow_files = [".h", ".hpp"]),
        "out": attr.output(),
        "_update_api": attr.label(
            default = "@z3//:update_api",
            executable = True,
            cfg = "exec",
        ),
    },
)

def _gen_db_impl(ctx):
    args = ctx.actions.args()
    args.add(ctx.file.smt2)
    args.add(ctx.outputs.out)

    ctx.actions.run(
        inputs = ctx.files.hdrs + [ctx.file.smt2],
        outputs = [ctx.outputs.out],
        executable = ctx.executable._mk_pat_db,
        arguments = [args],
        mnemonic = "MkPatDB",
    )

gen_db = rule(
    implementation = _gen_db_impl,
    attrs = {
        "hdrs": attr.label_list(allow_files = [".h", ".hpp"]),
        "smt2": attr.label(allow_single_file = [".smt2"]),
        "out": attr.output(),
        "_mk_pat_db": attr.label(
            default = "@z3//:mk_pat_db",
            executable = True,
            cfg = "exec",
        ),
    },
)

def _gen_install_tactic_impl(ctx):
    deps = ctx.actions.declare_file("install_tactic.deps")

    content = ctx.actions.args()
    content.add_all(ctx.files.hdrs)

    args = ctx.actions.args()
    args.add(ctx.outputs.out.dirname)
    args.add(deps)

    ctx.actions.write(deps, content)
    ctx.actions.run(
        inputs = ctx.files.hdrs + [deps],
        outputs = [ctx.outputs.out],
        executable = ctx.executable._mk_install_tactic,
        arguments = [args],
        mnemonic = "InstallTactic",
    )

gen_install_tactic = rule(
    implementation = _gen_install_tactic_impl,
    attrs = {
        "hdrs": attr.label_list(allow_files = [".h", ".hpp"]),
        "out": attr.output(),
        "_mk_install_tactic": attr.label(
            default = "@z3//:mk_install_tactic_cpp",
            executable = True,
            cfg = "exec",
        ),
    },
)

def _gen_gparams(ctx):
    args = ctx.actions.args()
    args.add(ctx.outputs.out.dirname)
    args.add_all(ctx.files.hdrs)

    ctx.actions.run(
        inputs = ctx.files.hdrs,
        outputs = [ctx.outputs.out],
        executable = ctx.executable._mk_gparams,
        arguments = [args],
        mnemonic = "GenGParams",
    )

gen_gparams = rule(
    implementation = _gen_gparams,
    attrs = {
        "hdrs": attr.label_list(allow_files = [".h", ".hpp"]),
        "out": attr.output(),
        "_mk_gparams": attr.label(
            default = "@z3//:mk_gparams_register_modules_cpp",
            executable = True,
            cfg = "exec",
        ),
    },
)

def _gen_version(ctx):
    components = ctx.attr.version.split(".")

    content = """
// automatically generated file.
#define Z3_MAJOR_VERSION   {}
#define Z3_MINOR_VERSION   {}
#define Z3_BUILD_NUMBER    {}
#define Z3_REVISION_NUMBER {}

#define Z3_FULL_VERSION    "{}"
""".format(
        components[0],
        components[1],
        components[2],
        components[3],
        ctx.attr.version,
    )

    ctx.actions.write(ctx.outputs.out, content)

gen_version = rule(
    implementation = _gen_version,
    attrs = {
        "version": attr.string(),
        "out": attr.output(),
    },
)
