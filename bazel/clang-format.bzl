"""
"""

_RULE_KINDS = [
    "cc_library",
    "cc_binary",
    "bitcode_library",
    "bitcode_library_standalone",
    "bitcode_binary",
]
_SRC_EXTS = [
    "cpp",
    "cxx",
    "cc",
]

FormatInfo = provider(
    "Formatted outputs built by the clang_format aspect",
    fields = ["sources"],
)

def _clang_format(target, ctx):
    if ctx.rule.kind not in _RULE_KINDS or ctx.label.workspace_root != "":
        return [FormatInfo(sources = depset([]))]

    inputs = []
    if hasattr(ctx.rule.attr, "srcs"):
        inputs += ctx.rule.files.srcs
    if hasattr(ctx.rule.attr, "hdrs"):
        inputs += ctx.rule.files.hdrs

    inputs = [file for file in inputs if file.is_source]
    files = {}

    depsrcs = []
    if hasattr(ctx.rule.attr, "deps"):
        for dep in ctx.rule.attr.deps:
            if FormatInfo in dep:
                depsrcs.append(dep[FormatInfo].sources)

    return [FormatInfo(
        sources = depset(inputs, transitive = depsrcs),
    )]

clang_format = aspect(
    implementation = _clang_format,
    attr_aspects = ["*"],
    attrs = {},
    provides = [FormatInfo],
)

def _format_rule(ctx, command):
    sources = depset(
        [],
        transitive = [dep[FormatInfo].sources for dep in ctx.attr.deps],
    )

    content = """#!/bin/bash
RESULT=0
"""

    # Note: hard-coded hack until I can figure out how to do this properly
    content += ctx.expand_location(
        "CLANG_FORMAT='$(rootpath {})'\n".format(ctx.attr._clang_format.label),
        targets = [ctx.attr._clang_format],
    )
    content += """
process()
{{
{}
}}
""".format(command)
    script = ctx.actions.declare_file(ctx.label.name + ".sh")
    bin_path = script.dirname + "/"

    for source in sources.to_list():
        content += "process '{}'\n".format(source.path)

    content += "exit $RESULT"

    script = ctx.actions.declare_file(ctx.label.name + ".sh")
    ctx.actions.write(
        output = script,
        content = content,
        is_executable = True,
    )

    runfiles = ctx.runfiles(
        files = [
            ctx.executable._clang_format,
            ctx.file._config,
        ],
        transitive_files = sources,
    )

    return [DefaultInfo(
        executable = script,
        runfiles = runfiles,
    )]

def _check_format(ctx):
    return _format_rule(
        ctx,
        """
if ! diff --color -u "$1" <("$CLANG_FORMAT" "$1"); then
    RESULT=1
fi
""",
    )

def _do_format(ctx):
    return _format_rule(
        ctx,
        """
"$CLANG_FORMAT" "$1" > temp.cpp
diff -u "$1" temp.cpp > temp.diff
if [ -s temp.diff ]; then
    echo "Formatting $1"
    cat temp.cpp > "$1"
fi
""",
    )

format_test = rule(
    implementation = _check_format,
    attrs = {
        "deps": attr.label_list(
            aspects = [clang_format],
            mandatory = True,
        ),
        "_config": attr.label(
            allow_single_file = True,
            default = "@caffeine//:.clang-format",
        ),
        "_clang_format": attr.label(
            executable = True,
            cfg = "host",
            default = "@llvm//clang:clang-format",
        ),
    },
    executable = True,
    test = True,
)

do_format = rule(
    implementation = _do_format,
    attrs = {
        "deps": attr.label_list(
            aspects = [clang_format],
            mandatory = True,
        ),
        "_config": attr.label(
            allow_single_file = True,
            default = "@caffeine//:.clang-format",
        ),
        "_clang_format": attr.label(
            executable = True,
            cfg = "host",
            default = "@llvm//clang:clang-format",
        ),
    },
    executable = True,
)
