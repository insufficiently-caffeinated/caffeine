workspace(name = "caffeine")

load("//bazel:dependencies.bzl", "caffeine_dependencies")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

load("@caffeine//third_party/z3:setup.bzl", "setup_z3")

caffeine_dependencies()

# Replace with the LLVM commit you want to use.
LLVM_COMMIT = "15e9575fb5988a66aa6e57a55818b54b575dd795"

http_archive(
    name = "llvm-raw",
    build_file_content = "# empty",
    patches = [
        "//third_party/llvm:clang.patch",
        "//third_party/llvm:llvm.patch",
    ],
    sha256 = "b440ecccc625915fd4c8dc69d1bed620ed996e60563dbbfa35279c31fd036d5d",
    strip_prefix = "llvm-project-" + LLVM_COMMIT,
    urls = ["https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT)],
)

http_archive(
    name = "capnproto",
    build_file = "//third_party/capnp:capnproto.BUILD",
    sha256 = "daf49f794560f715e2f4651c842aaece2d065d4216834c5c3d3254962e35b535",
    strip_prefix = "capnproto-0.9.1",
    urls = ["https://github.com/capnproto/capnproto/archive/refs/tags/v0.9.1.tar.gz"],
)

git_repository(
    name = "com_github_nelhage_rules_boost",
    commit = "fce83babe3f6287bccb45d2df013a309fa3194b8",
    remote = "https://github.com/nelhage/rules_boost",
    shallow_since = "1630079166 -0700",
)

setup_z3(name = "z3", version = "4.8.12")

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
load("@llvm-raw//utils/bazel:configure.bzl", "llvm_configure", "llvm_disable_optional_support_deps")

rules_foreign_cc_dependencies()

boost_deps()

llvm_configure(name = "llvm")

# Disables optional dependencies for Support like zlib and terminfo. You may
# instead want to configure them using the macros in the corresponding bzl
# files.
llvm_disable_optional_support_deps()
