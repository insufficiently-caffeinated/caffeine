"""Macros for compiling libraries down to LLVM bitcode
"""

BitcodeInfo = provider(
    "Header and includes information for a bitcode target. " +
    "Output dependency files are provided via DefaultInfo.",
    fields = {
        "includes": "Include paths from dependencies",
        "headers": "Headers that dependencies have exported",
    }
)

SRC_EXTS = [
    ".cc",
    ".cpp",
    ".cxx",
    ".c++",
    ".c",
    ".C",
    ".h",
    ".hh",
    ".hpp",
    ".ll",
    ".bc",
]

def update(src, upd):
    tgt = {}
    tgt.update(src)
    tgt.update(upd)
    return tgt

BITCODE_LIB_ATTRS = {
    "srcs": attr.label_list(allow_files = SRC_EXTS),
    "hdrs": attr.label_list(allow_files = True),
    "deps": attr.label_list(providers = [BitcodeInfo, DefaultInfo]),
    "includes": attr.string_list(),
    "copts": attr.string_list(),
    "linkopts": attr.string_list(),
    "_builtin_includes": attr.string_list(default = [
        # Builtin include paths for MacOSX
        "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1",
        "/Library/Developer/CommandLineTools/usr/lib/clang/13.0.0/include",
        "/Library/Developer/CommandLineTools/usr/include",
        "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include",
    ]),
    "_builtin_deps": attr.label_list(default = [
        "@//interface:caffeine",
        "@//libraries/builtins",
    ], providers = [BitcodeInfo, DefaultInfo]),
    "_clang": attr.label(executable = True, cfg = "host", default = "@llvm//clang"),
    "_llvm_link": attr.label(executable = True, cfg = "host", default = "@llvm//llvm:llvm-link"),
    "_llvm_opt": attr.label(executable = True, cfg = "host", default = "@llvm//llvm:opt"),
    "_opt_plugin": attr.label(executable = True, cfg = "host", default = "@//tools/opt-plugin"),
}

def _bitcode_library_common(ctx):
    actions = ctx.actions

    dep_includes = []
    dep_includes += ctx.attr._builtin_includes
    for dep in ctx.attr.deps:
        dep_includes += dep[BitcodeInfo].includes
    for dep in ctx.attr._builtin_deps:
        dep_includes += dep[BitcodeInfo].includes

    headers = depset(
        ctx.files.hdrs,
        transitive = [dep[BitcodeInfo].headers for dep in ctx.attr.deps] +
                     [dep[BitcodeInfo].headers for dep in ctx.attr._builtin_deps],
    )
    deps = depset(
        [],
        transitive = [dep[DefaultInfo].files for dep in ctx.attr.deps],
    )

    includes = []
    for inc in ctx.attr.includes:
        if inc.startswith("/"):
            includes.append(inc[1:])
        elif ctx.label.workspace_root == "":
            includes.append("{}/{}".format(ctx.label.package, inc))
        else:
            includes.append("{}/{}/{}".format(
                ctx.label.workspace_root,
                ctx.labe.package,
                inc,
            ))

    objects = []
    for src in ctx.files.srcs:
        if src.extension in ["bc", "ll"]:
            objects.append(src)

        if not src.extension in ["cc", "cxx", "c++", "cpp", "c", "C"]:
            continue

        object = actions.declare_file(src.path + ".bc")
        args = actions.args()
        args.add("-emit-llvm")
        args.add("-O3")
        args.add("-g")

        if src.extension == "c":
            args.add("-std=c11")
        else:
            args.add("-std=c++17")

        args.add_all(ctx.attr.copts)
        args.add_all(dep_includes, before_each = "-isystem")
        args.add_all(includes, before_each = "-I")
        args.add_all(["-c", src])
        args.add_all(["-o", object])

        actions.run(
            outputs = [object],
            inputs = depset(ctx.files.srcs, transitive = [headers]),
            executable = ctx.executable._clang,
            arguments = [args],
            mnemonic = "BitcodeCompile",
            progress_message = "Compiling {} to bitcode".format(src.path),
        )

        objects.append(object)

    opt_bitcode = None
    if len(objects) != 0:
        unopt_bitcode = actions.declare_file(ctx.label.name + ".unopt.bc")
        args = actions.args()
        args.add_all(objects)
        args.add_all(["-o", unopt_bitcode])

        actions.run(
            outputs = [unopt_bitcode],
            inputs = depset(objects),
            executable = ctx.executable._llvm_link,
            arguments = [args],
            mnemonic = "BitcodeLink",
            progress_message = "Linking {}".format(ctx.label),
        )

        opt_bitcode = actions.declare_file(ctx.label.name + ".opt.bc")
        args = actions.args()
        args.add("--load={}".format(ctx.executable._opt_plugin.path))
        args.add("--caffeine-gen-builtins")
        args.add(unopt_bitcode)
        args.add_all(["-o", opt_bitcode])

        actions.run(
            outputs = [opt_bitcode],
            inputs = [unopt_bitcode, ctx.executable._opt_plugin],
            executable = ctx.executable._llvm_opt,
            arguments = [args],
            mnemonic = "BitcodeOpt",
        )

    result = [
        BitcodeInfo(
            includes = dep_includes + includes,
            headers = headers,
        ),
    ]

    if not opt_bitcode:
        result.append(DefaultInfo(files = deps))
        return result

    linked_bitcode = actions.declare_file(ctx.label.name + ".bc")

    args = actions.args()
    args.add_all(ctx.attr.linkopts)
    args.add(opt_bitcode)
    args.add_all(deps)
    args.add_all(["-o", linked_bitcode])

    actions.run(
        outputs = [linked_bitcode],
        inputs = depset([opt_bitcode], transitive = [deps]),
        executable = ctx.executable._llvm_link,
        arguments = [args],
        mnemonic = "BitcodeLink",
    )

    result.append(DefaultInfo(files = depset([linked_bitcode])))
    return result

bitcode_library_standalone = rule(
    implementation = _bitcode_library_common,
    attrs = update(
        BITCODE_LIB_ATTRS,
        {
            "_builtin_deps": attr.label_list(providers = [BitcodeInfo, DefaultInfo]),
        },
    ),
)

bitcode_library = rule(
    implementation = _bitcode_library_common,
    attrs = BITCODE_LIB_ATTRS,
)
