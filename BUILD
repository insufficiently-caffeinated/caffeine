load("@bazel_skylib//rules:common_settings.bzl", "bool_flag", "string_flag")
load("//bazel:configure.bzl", "configure_file")
load("//bazel:warnings.bzl", "WARNING_FLAGS")
load("//bazel:packaging.bzl", "caffeine_naming", "pkg_headers")
load("//bazel:clang-format.bzl", "do_format", "format_test")
load("@hedron_compile_commands//:refresh_compile_commands.bzl", "refresh_compile_commands")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@rules_pkg//:mappings.bzl", "pkg_attributes", "pkg_filegroup", "pkg_files")
load("@rules_pkg//:install.bzl", "pkg_install")

package(default_visibility = ["//visibility:public"])

exports_files([".clang-format"])

####################################################################
# Configure Flags
####################################################################

string_flag(
    name = "version",
    build_setting_default = "0.0.0",
)

bool_flag(
    name = "enable-tracing",
    build_setting_default = False,
)

bool_flag(
    name = "enable-tracing-expensive-annotations",
    build_setting_default = False,
)

bool_flag(
    name = "enable-implicit-constant-folding",
    build_setting_default = True,
)

####################################################################

configure_file(
    name = "config-file",
    src = "Config.h.in",
    out = "Config.h",
    config = {
        "CAFFEINE_VERSION": "//:version",
        "CAFFEINE_ENABLE_TRACING": "//:enable-tracing",
        "CAFFEINE_TRACING_EXPENSIVE_ANNOTATIONS": "//:enable-tracing-expensive-annotations",
        "CAFFEINE_ENABLE_IMPLICIT_CONSTANT_FOLDING": "//:enable-implicit-constant-folding",
    },
)

configure_file(
    name = "cmake-config",
    src = "cmake/CaffeineBazelConfig.cmake.in",
    out = "caffeine-config.cmake",
    config = {
        "CAFFEINE_VERSION": "//:version",
    },
)

cc_library(
    name = "config",
    hdrs = ["Config.h"],
    include_prefix = "caffeine",
)

cc_library(
    name = "caffeine-assert",
    srcs = ["src/Support/Assert.cpp"],
    hdrs = [
        "include/caffeine/Support/Assert.h",
        "include/caffeine/Support/Macros.h",
    ],
    copts = WARNING_FLAGS,
    strip_include_prefix = "include",
    deps = ["@boost//:core"],
)

cc_library(
    name = "caffeine",
    srcs = glob([
        "src/**/*.cpp",
        "src/**/*.h",
    ]),
    hdrs = glob([
        "include/caffeine/**/*.inl",
        "include/caffeine/**/*.h",
    ]) +
    # TODO: This should be textual_hdrs but strip_include_prefix currently
    #       doesn't work on them. Once the issue in bazel is fixed these
    #       should be moved to textual_hdrs.
    #       issue: https://github.com/bazelbuild/bazel/issues/12424
    glob([
        "include/caffeine/**/*.def",
    ]),
    copts = WARNING_FLAGS,
    strip_include_prefix = "include",
    deps = [
        ":config",
        "//src/Protos:caffeine-protos",
        "//third_party:fmt",
        "//third_party:hopscotch-map",
        "//third_party:immer",
        "//third_party:magic-enum",
        "//third_party:z3",
        "//third_party/capnp",
        "@boost//:thread",
        "@llvm//llvm:Core",
        "@llvm//llvm:Support",
    ],
)

pkg_headers(
    name = "caffeine-headers",
    mappings = {
        "llvm/include": "",
    },
    visibility = ["//visibility:private"],
    deps = [":caffeine"],
)

cc_binary(
    name = "caffeine-shared",
    linkshared = 1,
    visibility = ["//visibility:private"],
    deps = [":caffeine"],
)

caffeine_naming(
    name = "caffeine-naming-vars",
)

FILE_RENAMES = {
    "//:caffeine-shared": "lib/libcaffeine.so",
    "//tools/opt-plugin": "lib/libcaffeine-opt-plugin.so",
    "//libraries/builtins": "lib/caffeine/caffeine-builtins.bc",
    "//libraries/libc": "lib/caffeine/libc.bc",
    "//libraries/libcxx": "lib/caffeine/libcxx.bc",
    "//:cmake-config": "lib/cmake/caffeine/caffeine-config.cmake",
    "//interface:caffeine.h": "include/caffeine/interface/caffeine.h",
    "scripts/vcpkg/gllvm-toolchain.cmake": "share/vcpkg/gllvm-toolchain.cmake",
    "scripts/vcpkg/x64-linux-gllvm.cmake": "share/vcpkg/x64-linux-gllvm.cmake",
}

BINARY_RENAMES = {
    "//tools/caffeine": "bin/caffeine",
    "@llvm//llvm:opt": "bin/caffeine-opt",
}

pkg_files(
    name = "caffeine-executables",
    srcs = BINARY_RENAMES.keys(),
    attributes = pkg_attributes(mode = "755"),
    renames = BINARY_RENAMES,
    visibility = ["//visibility:private"],
)

pkg_files(
    name = "caffeine-files",
    srcs = FILE_RENAMES.keys(),
    renames = FILE_RENAMES,
    visibility = ["//visibility:private"],
)

pkg_filegroup(
    name = "caffeine-package",
    srcs = [
        ":caffeine-executables",
        ":caffeine-files",
        ":caffeine-headers",
    ],
    visibility = ["//visibility:private"],
)

pkg_tar(
    name = "tarball",
    srcs = [
        ":caffeine-package",
    ],
    out = "caffeine.tar.gz",
    package_file_name = "caffeine-{mode}.tar.gz",
    package_variables = ":caffeine-naming-vars",
)

pkg_install(
    name = "install",
    srcs = [
        ":caffeine-package",
    ],
)

####################################################################

# All relevant targets within caffeine. This is used to discover
# source files that are used within these targets so that they
# can be formatted.
#
# Note that new dependencies of these targets will be implicitly
# added but other leaf targets will not.
CAFFEINE_TARGETS = [
    ":caffeine",
    "//test/unit:unit-lib",
    "//tools/caffeine",
    "//tools/guided-fuzzing",
    "//tools/opt-plugin",
]

format_test(
    name = "check-format",
    deps = CAFFEINE_TARGETS,
)

do_format(
    name = "format",
    deps = CAFFEINE_TARGETS,
)

refresh_compile_commands(
    name = "compile-commands",
    targets = [
        "//...",
    ],
)
