load("//bazel:warnings.bzl", "WARNING_FLAGS")

cc_library(
    name = "unit-lib",
    srcs = glob(
        ["**/*.cpp"],
        exclude = ["main.cpp"],
    ),
    copts = WARNING_FLAGS,
    data = ["Interpreter/ir-with-global.ll"],
    local_defines = ["CAFFEINE_BAZEL"],
    visibility = ["//:__pkg__"],
    deps = [
        "//:caffeine",
        "//third_party:gtest",
    ],
)

cc_test(
    name = "unit",
    srcs = ["main.cpp"],
    linkstatic = True,
    deps = [
        ":unit-lib",
    ],
)
