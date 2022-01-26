"""
"""

WARNING_FLAGS = select({
    "//bazel:clang": [
        # If a warning pops up in a external library then add an entry here
        # for it to silence the warning.
        "--system-header-prefix=llvm/",
        "--system-header-prefix=fmt/",
        "--system-header-prefix=immer/",
        "--system-header-prefix=capnp/",
        "-fcolor-diagnostics",
        "-Wall",
        "-Wextra",
        "-Wno-unknown-pragmas",
    ],
    "//bazel:gcc": [
        "-fdiagnostics-color=always",
        "-Wall",
        "-Wextra",
        "-Wno-unknown-pragmas",
    ],
    "//bazel:msvc": [
        "/experimental:external",
        "/external:anglebrackets",
        "/external:W0",
        "/W3",
        "-D_SILENCE_ALL_CXX17_DEPRECATION_WARNINGS=1",
    ],
    "//conditions:default": [],
})
