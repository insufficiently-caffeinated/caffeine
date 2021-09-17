"""
"""

def _contained_files(ctx, dir):
    files = []
    path = ctx.path(dir)

    for child in path.readdir():
        files.append("{}/{}".format(dir, child.basename))

    return files

def _vcpkg_library(ctx):
    if ctx.attr.package != "":
        package = ctx.attr.package
    else:
        package = ctx.name
    if ctx.attr.triplet != "":
        triplet = ctx.attr.triplet
    else:
        triplet = ctx.read(ctx.attr.triplet_file)

    result = ctx.execute([
        ctx.attr.vcpkg,
        "export",
        package,
        "--output-dir=..",
        "--output=" + ctx.name,
        "--raw",
        "--triplet=" + triplet,
    ])

    if result.return_code != 0:
        fail(
            """Vcpkg export for package '{}' failed.
stdout:
{}
stderr:
{}
""".format(package, result.stdout, result.stderr),
        )

    result = ctx.execute(
        ["mv"] + _contained_files(ctx, "installed/{}".format(triplet)) + ["."],
        quiet = False,
    )
    if result.return_code != 0:
        fail("Unable to move installed vcpkg files")

    if ctx.attr.build_file:
        ctx.file("BUILD", ctx.read(ctx.attr.build_file))
    else:
        ctx.file("BUILD", ctx.attr.build_file_content)

    if ctx.attr.workspace_file:
        ctx.file("WORKSPACE", ctx.read(ctx.attr.workspace_file))
    else:
        ctx.file("WORKSPACE", ctx.attr.workspace_file_content)

vcpkg_library = repository_rule(
    implementation = _vcpkg_library,
    local = True,
    attrs = {
        "package": attr.string(default = ""),
        "triplet": attr.string(default = ""),
        "build_file": attr.label(),
        "build_file_content": attr.string(default = ""),
        "workspace_file": attr.label(),
        "workspace_file_content": attr.string(default = ""),
        "triplet_file": attr.label(default = Label("@vcpkg//:triplet")),
        "vcpkg": attr.label(default = Label("@vcpkg-src//:vcpkg")),
    },
)
