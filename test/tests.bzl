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
            copts = ["-O3"],
        )

# buildifier: disable=function-docstring
# buildifier: disable=unnamed-macro
def generate_regression_tests():
    sources = native.glob([
        "issue-*.c",
        "issue-*.cpp",
        "issue-*.ll",
        "issue-*.bc",
    ])

    for file in sources:
        splits = file.split(".")
        status = splits[1]

        if status == "pass":
            should_fail = False
        elif status == "fail":
            should_fail = True
        else:
            fail("regression test filename was not in the expected format")

        caffeine_bitcode_test(
            name = _strip_ext(file),
            srcs = [file],
            should_fail = should_fail,
            copts = ["-O3"],
        )
