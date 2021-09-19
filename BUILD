load("@bazel_skylib//rules:common_settings.bzl", "bool_flag", "string_flag")
load("@//bazel:configure.bzl", "configure_file")

package(default_visibility = ["//visibility:public"])

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
    build_setting_default = False,
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
        "//third_party/divine",
        "@boost//:thread",
        "@llvm//llvm:Core",
        "@llvm//llvm:Passes",
    ],
)
