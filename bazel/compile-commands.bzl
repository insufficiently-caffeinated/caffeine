"""
"""

_SCRIPT = """
WORKSPACE="$(dirname \"$(readlink WORKSPACE)\")"
CWD="$(dirname \"${BASH_SOURCE[0]}\")"

cd "$WORKSPACE"
"$CWD/tools/compdb/compdb" 'deps(//...)' > compile_commands.json
"""

def _compile_commands(ctx):
    script = ctx.actions.declare_file(ctx.label.name + ".sh")

    ctx.actions.write(
        output = script,
        content = _SCRIPT,
        is_executable = True,
    )

    runfiles = ctx.runfiles(
        files = [
            ctx.file._workspace,
            ctx.executable._compdb,
        ],
    )

    return [DefaultInfo(executable = script, runfiles = runfiles)]

compile_commands = rule(
    implementation = _compile_commands,
    attrs = {
        "_workspace": attr.label(
            default = "@//:WORKSPACE",
            allow_single_file = True,
        ),
        "_compdb": attr.label(
            default = "@caffeine//tools/compdb",
            executable = True,
            cfg = "exec",
        ),
    },
    executable = True,
)
