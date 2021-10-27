"""
"""
load("@bazel_skylib//rules:copy_file.bzl", _copy_file = "copy_file")

def path_concat(*args):
    """Concatenate a list of paths

    Args:
      *args: The paths to concatenate.

    Returns:
      A path that consists of the individual path segments but concatenated.
    """
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

def _copy_files(ctx):
    outputs = []

    strip_prefix = ctx.attr.strip_prefix
    if not strip_prefix.startswith("/"):
        strip_prefix = path_concat(ctx.label.package, strip_prefix)
    
    strip_prefix = path_concat(ctx.label.workspace_root, strip_prefix)
    strip_len = len(strip_prefix) + 1

    bindir_prefix = path_concat(ctx.bin_dir.path, strip_prefix)
    gendir_prefix = path_concat(ctx.genfiles_dir.path, strip_prefix)

    for src in ctx.files.srcs:
        if src.path.startswith(strip_prefix):
            out_rel = src.path[strip_len:]
        elif src.path.startswith(bindir_prefix):
            out_rel = src.path[len(bindir_prefix) + 1:]
        elif src.path.startswith(gendir_prefix):
            out_rel = src.path[len(gendir_prefix) + 1:]
        else:
            fail("{} did not start with prefix {}".format(src.path, strip_prefix))

        if ctx.attr.output_to_bindir:
            out = ctx.actions.declare_file(path_concat(
                ctx.bin_dir.path,
                ctx.attr.prefix,
                out_rel
            ))
        else:
            out = ctx.actions.declare_file(path_concat(
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

def copy_file(name, src, is_executable = False, allow_symlink = False, **kwargs):
    """Copies a file to another location.

    This is a wrapper around copy_file within bazel-skylib.

    Args:
      name: Name of the rule.
      src: A Label. The file to make a copy of. (Can also be the label of a rule
          that generates a file.)
      is_executable: A boolean. Whether to make the output file executable. When
          True, the rule's output can be executed using `bazel run` and can be
          in the srcs of binary and test rules that require executable sources.
          WARNING: If `allow_symlink` is True, `src` must also be executable.
      allow_symlink: A boolean. Whether to allow symlinking instead of copying.
          When False, the output is always a hard copy. When True, the output
          *can* be a symlink, but there is no guarantee that a symlink is
          created (i.e., at the time of writing, we don't create symlinks on
          Windows). Set this to True if you need fast copying and your tools can
          handle symlinks (which most UNIX tools can).
      **kwargs: further keyword arguments, e.g. `visibility`
    """
    
    _copy_file(
        name = name + "#copy",
        src = src,
        out = name,
        is_executable = is_executable,
        allow_symlink = allow_symlink,
        **kwargs
    )
