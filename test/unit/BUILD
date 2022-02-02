load("//bazel:warnings.bzl", "WARNING_FLAGS")

cc_library(
    name = "unit-lib",
    srcs = glob(
        ["**/*.cpp"],
        exclude = ["main.cpp"],
    ),
    hdrs = glob(["**/*.h"]),
    copts = WARNING_FLAGS,
    data = ["Interpreter/ir-with-global.ll"],
    local_defines = [
        "CAFFEINE_BAZEL",
        "CAFFEINE_EXPOSE_FOR_TESTING",
    ],
    strip_include_prefix = "/test/unit",
    visibility = ["//:__pkg__"],
    deps = [
        "//:caffeine",
        "//third_party:gtest",
        "@llvm//llvm:IRReader",
    ],
    alwayslink = 1,
)

cc_test(
    name = "unit",
    srcs = ["main.cpp"],
    linkstatic = True,
    deps = [
        ":unit-lib",
    ],
)
