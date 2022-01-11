load("@bazel_skylib//rules:native_binary.bzl", "native_binary")

package(default_visibility = ["//visibility:public"])

native_binary(
    name = "clang",
    src = "@llvm_toolchain_llvm//:bin/clang",
    out = "clang",
)

native_binary(
    name = "llvm-dis",
    src = "@llvm_toolchain_llvm//:bin/llvm-dis",
    out = "llvm-dis",
)

native_binary(
    name = "llvm-link",
    src = "@llvm_toolchain_llvm//:bin/llvm-link",
    out = "llvm-link",
)

native_binary(
    name = "clang-format",
    src = "@llvm_toolchain_llvm//:bin/clang-format",
    out = "clang-format",
)

# alias(
#     name = "clang",
#     actual = "@llvm//clang",
# )

# alias(
#     name = "llvm-dis",
#     actual = "@llvm//llvm:llvm-dis",
# )

# alias(
#     name = "llvm-link",
#     actual = "@llvm//llvm:llvm-link",
# )

# alias(
#     name = "clang-format",
#     actual = "@llvm//clang:clang-format",
# )

# Note that opt must be built manually since we link against it.
alias(
    name = "opt",
    actual = "@llvm//llvm:opt",
)
