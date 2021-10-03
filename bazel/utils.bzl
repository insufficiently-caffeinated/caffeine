
def _copy_files(ctx):
    outputs = []

    strip_prefix = ctx.attr.strip_prefix
    if not strip_prefix.startswith("/"):
        strip_prefix = "{}/{}".format(ctx.label.package, ctx.attr.strip_prefix)
    
    strip_prefix = "{}/{}".format(ctx.label.workspace_root, strip_prefix)
    strip_len = len(strip_prefix) + 1

    bindir_prefix = "{}/{}".format(ctx.bin_dir.path, strip_prefix)
    gendir_prefix = "{}/{}".format(ctx.genfiles_dir.path, strip_prefix)

    for src in ctx.files.srcs:
        if src.path.startswith(strip_prefix):
            out_rel = src.path[strip_len:]
        elif src.path.startswith(bindir_prefix):
            out_rel = src.path[len(bindir_prefix) + 1:]
        elif src.path.startswith(gendir_prefix):
            out_rel = src.path[len(gendir_prefix) + 1:]
        else:
            fail("{} did not start with prefix {}", src.path, strip_prefix)

        if ctx.attr.output_to_bindir:
            out = ctx.actions.declare_file("{}/{}/{}".format(
                ctx.bin_dir.path,
                ctx.attr.prefix,
                out_rel
            ))
        else:
            out = ctx.actions.declare_file("{}/{}/{}".format(
                ctx.genfiles_dir.path,
                ctx.attr.prefix,
                out_rel
            ))

        args = ctx.actions.args()
        args.add(src)
        args.add(out)

        ctx.actions.run_shell(
            outputs = [out],
            inputs = [src],
            command = "mkdir -p $(dirname $2); cp $1 $2",
            arguments = [args],
            mnemonic = "CopyFile"
        )

        outputs.append(out)

    return [DefaultInfo(files = depset(outputs))]

copy_files = rule(
    implementation = _copy_files,
    attrs = {
        "srcs": attr.label_list(allow_files = True, mandatory = True),
        "prefix": attr.string(default = ""),
        "strip_prefix": attr.string(default = ""),
        "output_to_bindir": attr.bool(default = False),
    }
)
