"""
"""

load(
    "@rules_cc//cc:cc_toolchain_config_lib.bzl",
    "action_config",
    "feature",
    "flag_group",
    "flag_set",
    "tool",
)

def _bitcode_toolchain_config(ctx):
    # This assumes that the toolchain is not defined in the root repository
    tool_prefix = "../../"

    action_configs = [
        action_config(
            "c-compile",
            tools = [
                tool(tool_prefix + ctx.executable.clang.path),
            ],
        ),
        action_config(
            "c++-compile",
            tools = [
                tool(tool_prefix + ctx.executable.clang.path),
            ],
        ),
    ]

    features = [
        feature(
            name = "default_compiler_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [
                        "c-compile",
                        "c++-compile",
                    ],
                    flag_groups = [
                        flag_group(
                            flags = [
                                "-emit-llvm",
                                "-g",
                                "-nostdinc",
                                "-ffreestanding",
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        action_configs = action_configs,
        toolchain_identifier = "bitcode-toolchain",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "k8",
        target_libc = "unknown",
        compiler = "clang",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        cxx_builtin_include_directories = [
            "/usr/include",
        ],
    )

bitcode_toolchain_config = rule(
    implementation = _bitcode_toolchain_config,
    attrs = {
        "clang": attr.label(
            executable = True,
            cfg = "exec",
            mandatory = True,
        ),
        "llvm_link": attr.label(
            executable = True,
            cfg = "exec",
            mandatory = True,
        ),
        "opt": attr.label(
            executable = True,
            cfg = "exec",
            mandatory = True,
        ),
    },
)
