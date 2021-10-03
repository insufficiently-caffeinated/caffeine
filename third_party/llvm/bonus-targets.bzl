
def define_llvm_bonus_targets():
    native.cc_library(
        name = "headers",
        hdrs = glob(["include/**/*.h", "include/**/*.def"]) + [
            ":llvm_intrinsics_headers"
        ],
        strip_include_prefix = "include",
        deps = [
            ":config",
            ":attributes_gen",
            ":intrinsic_enums_gen",
            ":intrinsics_impl_gen",
        ]
    )

