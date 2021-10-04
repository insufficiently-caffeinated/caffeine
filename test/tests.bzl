load("//bazel:bitcode.bzl", "caffeine_bitcode_test")

def _strip_ext(path):
    for ext in [".c", ".cpp", ".ll", ".bc"]:
        if path.endswith(ext):
            return path[:-len(ext)]
    return path

def generate_tests(
        skip_files = [],
        should_fail = False):
    """
    """
    for file in native.glob(["*.c", "*.cpp", "*.ll", "*.bc"]):
        caffeine_bitcode_test(
            name = _strip_ext(file),
            srcs = [file],
            skip = file in skip_files,
            should_fail = should_fail
        )
