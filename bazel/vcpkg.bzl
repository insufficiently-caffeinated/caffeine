"""Rules for importing vcpkg packages as external repositories.
"""

VCPKG_BZLIGNORE = """
buildtrees/
packages/
downloads/
installed/
"""

def _setup_vcpkg_impl(ctx):
    ctx.report_progress("downloading and building vcpkg")
    output = ctx.download_and_extract(
        url = "https://github.com/microsoft/vcpkg/archive/refs/tags/" + ctx.attr.tag + ".tar.gz",
        type = "tar.gz",
        stripPrefix = "vcpkg-" + ctx.attr.tag,
        sha256 = ctx.attr.sha256,
    )

    ctx.file(
        ".bazelignore",
        content = VCPKG_BZLIGNORE
    )

    if ctx.os.name == "windows":
        result = ctx.execute(
            ["./bootstrap-vcpkg.bat", "-disableMetrics"],
            quiet = False,
        )
    else:
        result = ctx.execute(
            ["./bootstrap-vcpkg.sh", "-disableMetrics"],
            quiet = False,
        )

    if result.return_code != 0:
        fail("Failed to bootstrap vcpkg")

    ctx.file(
        "BUILD",
        content = """

""",
    )

    if ctx.attr.sha256 == "":
        return {"sha256": output.sha256}
    else:
        return None

init_vcpkg = repository_rule(
    implementation = _setup_vcpkg_impl,
    attrs = {
        "tag": attr.string(mandatory = True),
        "sha256": attr.string(default = ""),
    },
)

def _vcpkg_triplet(ctx):
    if ctx.attr.triplet != "":
        return ctx.attr.triplet
    elif ctx.os.name == "windows":
        return "x64-windows"
    elif ctx.os.name == "darwin" or ctx.os.name == "mac os x":
        return "x64-osx"
    elif ctx.os.name == "linux":
        return "x64-linux"
    else:
        ctx.execute(
            [ctx.attr.vcpkg, "help", "triplet"],
            quiet = False
        )

        fail("Unknown os: {}".format(ctx.os.name))

def _vcpkg_import(ctx):
    triplet = _vcpkg_triplet(ctx)

    result = ctx.execute(
        [
            ctx.attr.vcpkg,
            "install",
            "--triplet=" + triplet,
        ] + ctx.attr.packages,
        timeout = 3600,
        quiet = False,
    )

    if result.return_code != 0:
        fail("Unable to install packages")

    ctx.file(
        "WORKSPACE",
        content = """workspace(name = '{}')""".format(ctx.attr.name),
    )

    for package in ctx.attr.packages:
        result = ctx.execute([
            ctx.attr.vcpkg,
            "export",
            package,
            "--output-dir=.",
            "--output=" + package,
            "--zip",
            "--triplet=" + triplet,
        ])

        if result.return_code != 0:
            fail(
                ("Vcpkg export for package '{}' failed.\n" +
                 "stdout:\n{}\nstderr:\n{}\n")
                    .format(package, result.stdout, result.stderr),
            )

    ctx.file("triplet", content = triplet)
    ctx.file("BUILD", content = "")

vcpkg_import = repository_rule(
    implementation = _vcpkg_import,
    local = True,
    attrs = {
        "packages": attr.string_list(mandatory = True),
        "triplet": attr.string(default = ""),
        "vcpkg": attr.label(default = Label("@vcpkg-src//:vcpkg")),
    },
)
