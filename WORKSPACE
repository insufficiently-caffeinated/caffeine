workspace(name = "caffeine")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("@caffeine//third_party/llvm:setup.bzl", "setup_llvm")
load("@caffeine//third_party/capnp:setup.bzl", "setup_capnproto")
load("@caffeine//third_party/boost:setup.bzl", "setup_boost")
load("@caffeine//third_party/musl:setup.bzl", "setup_musl")
load("@caffeine//third_party/libcxx:setup.bzl", "setup_libcxx")
load("@caffeine//third_party/afl:setup.bzl", "setup_afl")

SKYLIB_VERSION = "1.1.1"

http_archive(
    name = "bazel_skylib",
    sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{version}/bazel-skylib-{version}.tar.gz".format(version = SKYLIB_VERSION),
        "https://github.com/bazelbuild/bazel-skylib/releases/download/{version}/bazel-skylib-{version}.tar.gz".format(version = SKYLIB_VERSION),
    ],
)

http_archive(
    name = "rules_cc",
    sha256 = "4dccbfd22c0def164c8f47458bd50e0c7148f3d92002cdb459c2a96a68498241",
    urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.1/rules_cc-0.0.1.tar.gz"],
)
http_archive(
    name = "rules_pkg",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.5.1/rules_pkg-0.5.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.5.1/rules_pkg-0.5.1.tar.gz",
    ],
    sha256 = "a89e203d3cf264e564fcb96b6e06dd70bc0557356eb48400ce4b5d97c2c3720d",
)

setup_capnproto(name = "capnproto")
setup_llvm(name = "llvm-raw")
setup_boost(name = "com_github_nelhage_rules_boost")
setup_musl(name = "musl")
setup_libcxx(name = "libcxx")
setup_afl(name = "afl")

# Some dependencies require multiple setup stages. These are added here.

local_repository(
    name = "caffeine_toolchain",
    path = "bazel/toolchain",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
load("@llvm-bazel//:configure.bzl", "llvm_configure", "llvm_disable_optional_support_deps")
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

boost_deps()

rules_pkg_dependencies()

llvm_configure(
    name = "llvm",
    src_path = ".",
    src_workspace = "@llvm-raw//:WORKSPACE",
    targets = [
        "X86",
    ],
)

# Disables optional dependencies for Support like zlib and terminfo. You may
# instead want to configure them using the macros in the corresponding bzl
# files.
llvm_disable_optional_support_deps()

# Hedron's Compile Commands Extractor for Bazel
# https://github.com/hedronvision/bazel-compile-commands-extractor
http_archive(
    name = "hedron_compile_commands",
    url = "https://github.com/hedronvision/bazel-compile-commands-extractor/archive/084957eaa1bf6e2bd031f50b1f5d04c89273103a.tar.gz",
    sha256 = "39e7607efcaca5abb34314744491492d82d30fcb6f6592d88ae15772da588b42",
    strip_prefix = "bazel-compile-commands-extractor-084957eaa1bf6e2bd031f50b1f5d04c89273103a",
)
load("@hedron_compile_commands//:workspace_setup.bzl", "hedron_compile_commands_setup")
hedron_compile_commands_setup()
