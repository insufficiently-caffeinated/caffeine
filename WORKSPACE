workspace(name = "caffeine")

load("//bazel:dependencies.bzl", "caffeine_dependencies")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("@caffeine//third_party/z3:setup.bzl", "setup_z3")
load("@caffeine//third_party/magic_enum:setup.bzl", "setup_magic_enum")
load("@caffeine//third_party/fmt:setup.bzl", "setup_fmt")
load("@caffeine//third_party/immer:setup.bzl", "setup_immer")
load("@caffeine//third_party/llvm:setup.bzl", "setup_llvm")
load("@caffeine//third_party/capnp:setup.bzl", "setup_capnproto")
load("@caffeine//third_party/googletest:setup.bzl", "setup_googletest")
load("@caffeine//third_party/boost:setup.bzl", "setup_boost")
load("@caffeine//third_party/musl:setup.bzl", "setup_musl")
load("@caffeine//third_party/libcxx:setup.bzl", "setup_libcxx")

caffeine_dependencies()

http_archive(
    name = "rules_cc",
    sha256 = "4dccbfd22c0def164c8f47458bd50e0c7148f3d92002cdb459c2a96a68498241",
    urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.1/rules_cc-0.0.1.tar.gz"],
)

setup_z3(name = "z3")
setup_magic_enum(name = "magic-enum")
setup_fmt(name = "fmt")
setup_immer(name = "immer")
setup_capnproto(name = "capnproto")
setup_llvm(name = "llvm-raw")
setup_googletest(name = "googletest")
setup_boost(name = "com_github_nelhage_rules_boost")
setup_musl(name = "musl")
setup_libcxx(name = "libcxx")

# Some dependencies require multiple setup stages. These are added here.

local_repository(
    name = "caffeine_toolchain",
    path = "bazel/toolchain",
)

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
load("@llvm-bazel//:configure.bzl", "llvm_configure", "llvm_disable_optional_support_deps")

rules_foreign_cc_dependencies()

boost_deps()

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

BAZEL_TOOLCHAIN_TAG = "0.6.3"
BAZEL_TOOLCHAIN_SHA = "da607faed78c4cb5a5637ef74a36fdd2286f85ca5192222c4664efec2d529bb8"

http_archive(
    name = "com_grail_bazel_toolchain",
    sha256 = BAZEL_TOOLCHAIN_SHA,
    strip_prefix = "bazel-toolchain-{tag}".format(tag = BAZEL_TOOLCHAIN_TAG),
    canonical_id = BAZEL_TOOLCHAIN_TAG,
    url = "https://github.com/grailbio/bazel-toolchain/archive/{tag}.tar.gz".format(tag = BAZEL_TOOLCHAIN_TAG),
)

load("@com_grail_bazel_toolchain//toolchain:deps.bzl", "bazel_toolchain_dependencies")

bazel_toolchain_dependencies()

load("@com_grail_bazel_toolchain//toolchain:rules.bzl", "llvm_toolchain")

llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "13.0.0",
    absolute_paths = True,
)

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")

llvm_register_toolchains()
