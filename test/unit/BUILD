load("//bazel:warnings.bzl", "WARNING_FLAGS")

cc_test(
    name = "unit",
    srcs = glob(["**/*.cpp"]),
    data = ["Interpreter/ir-with-global.ll"],
    linkstatic = True,
    deps = [
        "//:caffeine",
        "//third_party:gtest",
    ],
    local_defines = ["CAFFEINE_BAZEL"],
    copts = WARNING_FLAGS
)
