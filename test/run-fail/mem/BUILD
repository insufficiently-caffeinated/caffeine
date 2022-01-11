load("//test:tests.bzl", "generate_tests")
load("//bazel:bitcode.bzl", "caffeine_bitcode_test")

generate_tests(
    exclude = ["alloca-escaped.c"],
    should_fail = True,
)

caffeine_bitcode_test(
    name = "alloca-escaped",
    srcs = ["alloca-escaped.c"],
    copts = [
        "-O3",
        "-Wno-return-stack-address",
    ],
    should_fail = True,
)
