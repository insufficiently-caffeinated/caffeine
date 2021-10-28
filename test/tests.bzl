"""
"""

load("//bazel:bitcode.bzl", "caffeine_bitcode_test")

def _strip_ext(path):
    for ext in [".c", ".cpp", ".ll", ".bc"]:
        if path.endswith(ext):
            return path[:-len(ext)]
    return path

# buildifier: disable=function-docstring
# buildifier: disable=unnamed-macro
def generate_tests(
        skip_files = [],
        should_fail = False,
        exclude = []):
    sources = native.glob([
        "**/*.c",
        "**/*.cpp",
        "**/*.ll",
        "**/*.bc",
    ], exclude = exclude)

    for file in sources:
        caffeine_bitcode_test(
            name = _strip_ext(file),
            srcs = [file],
            skip = file in skip_files,
            should_fail = should_fail,
        )
