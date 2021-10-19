"""
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def setup_fmt(name):
    # TODO: Bazel support within fmt was added more recently than the latest release.
    #       Once the next release is made we should update to that.
    git_repository(
        name = name,
        remote = "https://github.com/fmtlib/fmt",
        patch_cmds = [
            "mv support/bazel/BUILD.bazel BUILD.bazel",
            "mv support/bazel/WORKSPACE.bazel WORKSPACE.bazel",
        ],
        # Windows-related patch commands are only needed in the case MSYS2 is not installed.
        # More details about the installation process of MSYS2 on Windows systems can be found here:
        # https://docs.bazel.build/versions/main/install-windows.html#installing-compilers-and-language-runtimes
        # Even if MSYS2 is installed the Windows related patch commands can still be used.
        patch_cmds_win = [
            "Move-Item -Path support/bazel/BUILD.bazel -Destination BUILD.bazel",
            "Move-Item -Path support/bazel/WORKSPACE.bazel -Destination WORKSPACE.bazel",
        ],
        commit = "1266c2b6003e6391046bbab57dcf20293e25dedd",
        shallow_since = "1634486868 -0700",
    )
