package(default_visibility = ["//visibility:public"])

sh_binary(
    name = "clang",
    srcs = ["@llvm_toolchain_llvm//:bin/clang"],
)

sh_binary(
    name = "llvm-dis",
    srcs = ["@llvm_toolchain_llvm//:bin/llvm-dis"],
)

sh_binary(
    name = "llvm-link",
    srcs = ["@llvm_toolchain_llvm//:bin/llvm-link"],
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

# Note that opt must be built manually since we link against it.
alias(
    name = "opt",
    actual = "@llvm//llvm:opt",
)
