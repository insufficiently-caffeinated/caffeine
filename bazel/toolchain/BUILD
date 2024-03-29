load("//:bitcode.bzl", "bitcode_toolchain_config")

package(default_visibility = ["//visibility:public"])

filegroup(name = "empty")

filegroup(
    name = "toolchain-files",
    srcs = ["@llvm//clang"],
    visibility = ["//visibility:public"],
)

cc_toolchain_suite(
    name = "bitcode",
    toolchains = {
        # All CPUs supported by bazel (from the source code)
        cpu: ":bitcode-toolchain"
        for cpu in [
            "darwin",
            "freebsd",
            "x64_windows",
            "piii",
            "k8",
            "ppc",
            "arm",
            "aarch64",
            "s390x",
            "unknown",
        ]
    },
    visibility = ["//visibility:public"],
)

cc_toolchain(
    name = "bitcode-toolchain",
    all_files = ":toolchain-files",
    compiler_files = ":toolchain-files",
    dwp_files = ":empty",
    linker_files = ":toolchain-files",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
    toolchain_config = ":bitcode-toolchain-config",
    toolchain_identifier = "bitcode-toolchain",
)

bitcode_toolchain_config(
    name = "bitcode-toolchain-config",
    clang = "@llvm//clang:clang",
    llvm_link = "@llvm//llvm:llvm-link",
    opt = "@llvm//llvm:opt",
)
