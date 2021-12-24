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
    url = "https://github.com/hedronvision/bazel-compile-commands-extractor/archive/ea0cda20c126b1df5cd3a056f8bd897aae7e2f28.tar.gz",
    sha256 = "567322ef8d2cb80b2d03ecd9ebcde1a7f68dd65f13676e4864578f3a10013b9e",
    strip_prefix = "bazel-compile-commands-extractor-ea0cda20c126b1df5cd3a056f8bd897aae7e2f28",
    # By default the script generates an entry for every single source file that
    # includes each header. This causes us to generate a 5.7GB file for caffeine
    # and is more or less completely untenable. This patch changes it to only
    # generate 1 entry per file, which reduces the file size down to ~20MB.
    patches = ["//third_party/hedron:hedron.diff"],
)
load("@hedron_compile_commands//:workspace_setup.bzl", "hedron_compile_commands_setup")
hedron_compile_commands_setup()
