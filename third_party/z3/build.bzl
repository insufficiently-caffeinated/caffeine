""

load(
    "@caffeine//third_party/z3:build-defs.bzl",
    "gen_api",
    "gen_db",
    "gen_gparams",
    "gen_install_tactic",
    "mem_initializer",
    "pyg2hpp",
)

PY_BINARIES = [
    "mk_consts_files",
    "mk_copyright",
    "mk_def_file",
    "mk_exception",
    "mk_genfile_common",
    "mk_gparams_register_modules_cpp",
    "mk_install_tactic_cpp",
    "mk_make",
    "mk_mem_initializer_cpp",
    "mk_nuget_task",
    "mk_pat_db",
    "mk_project",
    "mk_unix_dist",
    "mk_util",
    "mk_win_dist",
    "pyg2hpp",
    "update_api",
]

[
    py_binary(
        name = binary,
        srcs = ["scripts/{}.py".format(binary)],
    )
    for binary in PY_BINARIES
]

mem_initializer(
    name = "gen_mem_initializer",
    srcs = glob(["src/util/*.h"]),
)

PYGFILES = glob(["src/**/*.pyg"])
PYGHDRS = [
    pyg[:-len("pyg")] + "hpp"
    for pyg in PYGFILES
]

[
    pyg2hpp(
        name = pyg.replace("/", "_"),
        src = pyg,
        out = pyg[:-len("pyg")] + "hpp",
    )
    for pyg in PYGFILES
]

EXCLUDES = [
    "src/api/dll/**",
    "src/api/dotnet/**",
    "src/api/java/**",
    "src/api/julia/**",
    "src/api/ml/**",
    "src/api/python/**",
    "src/shell/**",
    "src/test/**",
]

Z3_HDRS = glob(["src/**/*.h"], exclude = EXCLUDES)

gen_api(
    name = "gen_api",
    hdrs = Z3_HDRS,
    out = "src/api/api_log_macros.h",
)

gen_db(
    name = "gen_db",
    hdrs = Z3_HDRS,
    smt2 = "src/ast/pattern/database.smt2",
    out = "src/ast/pattern/database.h",
)

gen_install_tactic(
    name = "gen_install_tactic",
    hdrs = Z3_HDRS,
    out = "src/install_tactic.cpp",
)

gen_gparams(
    name = "gen_gparams",
    hdrs = Z3_HDRS,
    out = "src/gparams_register_modules.cpp",
)

cc_library(
    name = "z3-impl",
    hdrs = Z3_HDRS + PYGHDRS + [
        "src/api/api_log_macros.h",
        "src/ast/pattern/database.h",
    ],
    srcs = glob(["src/**/*.cpp"], exclude = EXCLUDES) + [
        ":gen_api",
        ":gen_mem_initializer",
        "src/install_tactic.cpp",
        "src/gparams_register_modules.cpp",
    ],
    strip_include_prefix = "src",
    local_defines = [
        "_MP_INTERNAL",
    ],
)

cc_binary(
    name = "z3-shared",
    deps = [":z3-impl"],
    linkshared = True,
)

cc_import(
    name = "z3-import",
    shared_library = ":z3-shared",
)

cc_library(
    name = "z3-cpp-api",
    hdrs = [
        "src/api/c++/z3++.h",
    ],
    strip_include_prefix = "src/api/c++",
)

cc_library(
    name = "z3",
    hdrs = glob([
        "src/api/z3_*.h",
    ]) + [
        "src/api/z3.h",
    ],
    strip_include_prefix = "src/api",
    deps = [
        # TODO: This should use implementation_deps once bazel 5.0 is out
        ":z3-impl",
        ":z3-cpp-api",
    ],
    visibility = ["//visibility:public"],
)
