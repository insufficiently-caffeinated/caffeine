load("//test:tests.bzl", "generate_tests")
load("//bazel:bitcode.bzl", "caffeine_bitcode_test")

generate_tests(
    exclude = [
        "collatz.c",
        "murmurhash3.c"
    ],
    should_fail = True,
)

caffeine_bitcode_test(
    name = "collatz",
    srcs = ["collatz.c"],
    should_fail = True,
    tags = ["manual"]
)

caffeine_bitcode_test(
    name = "murmurhash3",
    srcs = ["murmurhash3.c"],
    should_fail = True,
    tags = ["manual"]
)
