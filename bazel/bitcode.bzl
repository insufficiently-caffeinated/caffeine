"""Macros for compiling libraries down to LLVM bitcode
"""

def update(*args):
    tgt = {}
    for arg in args:
        tgt.update(arg)
    return tgt

BitcodeCcInfo = provider(
    "Compilation info fror bitcode",
    fields = [
        "cc_info",
        "bitcode",
    ],
)

_ALLOWED_SRC_EXTS = [
    ".cpp",
    ".cc",
    ".cxx",
    ".c++",
    ".c",
    ".h",
    ".hh",
    ".hpp",
    ".bc",
    ".ll",
]

BITCODE_LIB_ATTRS = {
    "srcs": attr.label_list(allow_files = _ALLOWED_SRC_EXTS),
    "hdrs": attr.label_list(allow_files = True),
    "deps": attr.label_list(providers = [BitcodeCcInfo]),
    "copts": attr.string_list(),
    "linkopts": attr.string_list(),
    "includes": attr.string_list(),
    "defines": attr.string_list(),
    "local_defines": attr.string_list(),
    "include_prefix": attr.string(),
    "strip_include_prefix": attr.string(),
    "_builtin_deps": attr.label_list(
        default = [
            "@caffeine//interface:caffeine",
            "@caffeine//libraries/builtins",
            "@musl//:libc",
        ],
        providers = [BitcodeCcInfo],
    ),
    "_internal_deps": attr.label_list(
        providers = [CcInfo],
        default = ["@llvm//clang:builtin-headers"],
    ),
    "_llvm_link": attr.label(
        default = "@llvm//llvm:llvm-link",
        executable = True,
        cfg = "exec",
    ),
    "_lib_ext": attr.string(default = ".bc"),
    "_cc_toolchain": attr.label(
        default = Label("@caffeine_toolchain//:bitcode"),
        providers = [cc_common.CcToolchainInfo],
    ),
}

BITCODE_BIN_ATTRS = update(
    BITCODE_LIB_ATTRS,
    {
        "opts": attr.string_list(
            default = ["-O3"],
            doc = "Options to pass to the final opt invocation",
        ),
        "_lib_ext": attr.string(default = ".lib.bc"),
        "_bin_ext": attr.string(default = ".bc"),
        "_llvm_dis": attr.label(
            default = "@llvm//llvm:llvm-dis",
            executable = True,
            cfg = "exec",
        ),
        "_llvm_opt": attr.label(
            executable = True,
            cfg = "exec",
            default = "@llvm//llvm:opt",
        ),
        "_opt_plugin": attr.label(
            executable = True,
            cfg = "exec",
            default = "@caffeine//tools/opt-plugin",
        ),
    },
)

_ALLOWED_HDR_EXTS = [".h", ".hh", ".hpp", ".ipp", ".hxx", ".h++", ".inc", ".inl", ".tlh", ".tli", ".H", ".tcc"]

def _bitcode_library_common(ctx):
    cc_toolchain = ctx.attr._cc_toolchain[cc_common.CcToolchainInfo]
    feature_configuration = cc_common.configure_features(
        ctx = ctx,
        cc_toolchain = cc_toolchain,
        requested_features = ctx.features,
        unsupported_features = ctx.disabled_features,
    )

    deps = ctx.attr.deps + ctx.attr._builtin_deps
    public_hdrs = [hdr for hdr in ctx.files.hdrs if hdr.extension in [x[1:] for x in _ALLOWED_HDR_EXTS]]
    addtnl_hdrs = [hdr for hdr in ctx.files.hdrs if hdr.extension not in [x[1:] for x in _ALLOWED_HDR_EXTS]]
    private_hdrs = [hdr for hdr in ctx.files.srcs if hdr.extension in _ALLOWED_HDR_EXTS]
    srcs = [src for src in ctx.files.srcs if src.extension in ["cpp", "cc", "cxx", "c++", "c"]]

    comp_ctx, outputs = cc_common.compile(
        name = ctx.label.name,
        actions = ctx.actions,
        feature_configuration = feature_configuration,
        cc_toolchain = cc_toolchain,
        public_hdrs = public_hdrs,
        private_hdrs = private_hdrs,
        srcs = srcs,
        includes = ctx.attr.includes,
        defines = ctx.attr.defines,
        local_defines = ctx.attr.local_defines,
        include_prefix = ctx.attr.include_prefix,
        strip_include_prefix = ctx.attr.strip_include_prefix,
        user_compile_flags = ctx.attr.copts,
        compilation_contexts = [
            info[BitcodeCcInfo].cc_info.compilation_context
            for info in deps
        ] + [
            info[CcInfo].compilation_context
            for info in ctx.attr._internal_deps
        ],
        additional_inputs = cc_toolchain.all_files.to_list() + addtnl_hdrs,
    )

    bcobjects = [src for src in ctx.files.srcs if src.extension in ["ll", "bc"]]
    for obj in outputs.objects:
        bc = ctx.actions.declare_file(obj.basename + ".bc", sibling = obj)
        ctx.actions.symlink(
            output = bc,
            target_file = obj,
        )

        bcobjects.append(bc)

    if len(bcobjects) != 0:
        bcfile = ctx.actions.declare_file(ctx.label.name + ctx.attr._lib_ext)
        inputs = depset(bcobjects)

        args = ctx.actions.args()
        args.add_all(inputs)
        args.add_all(ctx.attr.linkopts)
        args.add("-o")
        args.add(bcfile)

        ctx.actions.run(
            outputs = [bcfile],
            inputs = inputs,
            executable = ctx.executable._llvm_link,
            arguments = [args],
            mnemonic = "BitcodeLink",
        )

        bitcode = depset(
            [bcfile],
            transitive = [dep[BitcodeCcInfo].bitcode for dep in deps],
        )
    else:
        bitcode = depset([], transitive = [dep[BitcodeCcInfo].bitcode for dep in deps])
        bcfile = None

    return [
        BitcodeCcInfo(
            cc_info = CcInfo(compilation_context = comp_ctx),
            bitcode = bitcode,
        ),
        DefaultInfo(files = depset([bcfile] if bitcode else [])),
    ]

bitcode_library = rule(
    implementation = _bitcode_library_common,
    attrs = BITCODE_LIB_ATTRS,
    fragments = ["cpp"],
)

bitcode_library_standalone = rule(
    implementation = _bitcode_library_common,
    attrs = update(
        BITCODE_LIB_ATTRS,
        {"_builtin_deps": attr.label_list(providers = [BitcodeCcInfo])},
    ),
    fragments = ["cpp"],
)

def _bitcode_binary(ctx):
    result = _bitcode_library_common(ctx)
    files = result[0].bitcode

    linked = ctx.actions.declare_file("{}.linked.bc".format(ctx.label.name))
    args = ctx.actions.args()
    args.add_all(files)
    args.add_all(ctx.attr.linkopts)
    args.add("-o")
    args.add(linked)

    ctx.actions.run(
        inputs = files,
        outputs = [linked],
        executable = ctx.executable._llvm_link,
        arguments = [args],
        mnemonic = "BitcodeLink",
    )

    output = ctx.actions.declare_file(ctx.label.name + ctx.attr._bin_ext)
    args = ctx.actions.args()
    args.add_all(["--load", ctx.executable._opt_plugin.path])
    args.add_all(ctx.attr.opts)
    args.add_all([
        "--caffeine-gen-builtins",
        "--internalize",
        "--internalize-public-api-list",
        "main",
        "--globaldce",
    ])
    args.add(linked)
    args.add("-o")
    args.add(output)

    ctx.actions.run(
        inputs = [ctx.executable._opt_plugin, linked],
        outputs = [output],
        executable = ctx.executable._llvm_opt,
        arguments = [args],
        mnemonic = "BitcodeBinaryOpt",
    )

    disassembled = ctx.actions.declare_file(ctx.label.name + ".ll")
    args = ctx.actions.args()
    args.add(output)
    args.add_all(["-o", disassembled])

    ctx.actions.run(
        inputs = [output],
        outputs = [disassembled],
        executable = ctx.executable._llvm_dis,
        arguments = [args],
        mnemonic = "BitcodeDisassemble",
    )

    return [
        DefaultInfo(files = depset([output])),
        OutputGroupInfo(
            bitcode = depset([output]),
            ir = depset([disassembled]),
        ),
    ]

bitcode_binary = rule(
    implementation = _bitcode_binary,
    attrs = BITCODE_BIN_ATTRS,
    fragments = ["cpp"],
)

def _bitcode_import(ctx):
    return [
        BitcodeCcInfo(
            cc_info = ctx.attr.dep[CcInfo],
            bitcode = depset(ctx.files.bitcode),
        ),
    ]

bitcode_import = rule(
    implementation = _bitcode_import,
    attrs = {
        "dep": attr.label(
            providers = [CcInfo],
            mandatory = True,
        ),
        "bitcode": attr.label(allow_files = [".bc", ".ll"]),
    },
)

def _bitcode_optimize(ctx):
    output = ctx.actions.declare_file(ctx.label.name + ".bc")

    args = ctx.actions.args()
    args.add_all(ctx.files.plugins, uniquify = True, before_each = "--load")
    args.add_all(ctx.attr.args)
    args.add(ctx.file.src)
    args.add("-o")
    args.add(output)

    ctx.actions.run(
        outputs = [output],
        inputs = ctx.files.plugins + ctx.files.data + [ctx.file.src],
        executable = ctx.executable._opt,
        arguments = [args],
        mnemonic = "BitcodeLink",
        progress_message = "Optimizing %{input}",
    )

    return [DefaultInfo(files = depset([output]))]

bitcode_optimize = rule(
    implementation = _bitcode_optimize,
    attrs = {
        "src": attr.label(allow_single_file = [".bc", ".ll"]),
        "plugins": attr.label_list(
            default = ["@caffeine//tools/opt-plugin"],
            cfg = "exec",
        ),
        "args": attr.string_list(),
        "data": attr.label_list(allow_files = True),
        "_opt": attr.label(
            default = "@llvm//llvm:opt",
            executable = True,
            cfg = "exec",
        ),
    },
)

def caffeine_bitcode_test(should_fail = False, skip = False, **kwargs):
    """Tests that a bitcode file executes as expected.

    This variant will generate a main method that calls the existing test method with
    symbolic arguments.

    Args:
      should_fail: Whether the test is expected to fail
      skip: Whether or not to disable the test.
      **kwargs: All arguments as passed to bitcode_test
    """

    test_args = {}

    if not "opts" in kwargs:
        kwargs["opts"] = []

    if "visibility" in kwargs:
        test_args.update({"visibility": kwargs["visibility"]})
        kwargs["size"] = None

    if "size" in kwargs:
        test_args.update({"size": kwargs["size"]})
        kwargs["size"] = None

    name = kwargs["name"]

    kwargs["name"] += "#binary"
    kwargs["opts"].append("--caffeine-gen-test-main")

    bitcode_binary(**kwargs)

    native.filegroup(
        name = name + "#bitcode",
        srcs = [":{}#binary".format(name)],
        output_group = "ir",
    )

    tags = ["no-sandbox"]
    if skip:
        tags.append("manual")

    args = [
        "$(location @//tools/caffeine)",
        "$(location {}#bitcode)".format(name),
    ]
    if should_fail:
        args.append("--invert-exitcode")

    native.sh_test(
        name = name,
        srcs = ["@//bazel:run_command.sh"],
        tags = tags,
        args = args,
        data = [
            ":{}#bitcode".format(name),
            "@llvm//llvm:llvm-symbolizer",
            "@//tools/caffeine",
        ],
        env = {
            "LLVM_SYMBOLIZER_PATH": "$(location @llvm//llvm:llvm-symbolizer)",
        },
        **test_args
    )
