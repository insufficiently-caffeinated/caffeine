""

load("@rules_pkg//:providers.bzl", "PackageFilesInfo", "PackageVariablesInfo")

_RULE_KINDS = [
    "cc_library",
]

MappingInfo = provider(
    "Mapping of headers to include paths",
    fields = [
        "files",
        "depset",
    ],
)

def _strip_prefix(path, prefix):
    if path.startswith(prefix):
        return path[len(prefix):].strip("/")
    return path.strip("/")

def _strip_prefixes(path, *prefixes):
    for prefix in prefixes:
        path = _strip_prefix(path, prefix)
    return path

def _library_public_headers(target, ctx):
    if ctx.rule.kind not in _RULE_KINDS:
        return [MappingInfo(files = {}, depset = depset([]))]

    files = {}
    transitive = []
    if hasattr(ctx.rule.attr, "deps"):
        for dep in ctx.rule.attr.deps:
            if MappingInfo in dep:
                files.update(dep[MappingInfo].files)
                transitive.append(dep[MappingInfo].depset)

    include_prefix = ""
    if hasattr(ctx.rule.attr, "strip_include_prefix"):
        include_prefix = ctx.rule.attr.strip_include_prefix.strip("/")

    direct = []
    if hasattr(ctx.rule.attr, "hdrs"):
        for file in ctx.rule.files.hdrs:
            path = file.path
            path = _strip_prefix(path, file.root.path)

            if path.startswith("external/"):
                path = path.split("/", 2)[2]

            path = _strip_prefix(path, include_prefix)

            # print(file.path, path, include_prefix)

            files[path] = file
        direct = ctx.rule.files.hdrs

    return [
        MappingInfo(
            files = files,
            depset = depset(direct, transitive = transitive),
        ),
    ]

library_public_headers = aspect(
    implementation = _library_public_headers,
    attr_aspects = ["deps"],
    provides = [MappingInfo],
)

def _pkg_headers(ctx):
    files = {}
    transitive = []
    for dep in ctx.attr.deps:
        files.update(dep[MappingInfo].files)
        transitive.append(dep[MappingInfo].depset)

    outputs = {}
    for path, file in files.items():
        for prefix, replacement in ctx.attr.mappings.items():
            if path.startswith(prefix):
                path = "{}/{}".format(replacement, path[len(prefix):].strip("/"))

        path = "{}/{}".format(ctx.attr.prefix, path.strip("/"))
        # print(path, ":", file)

        outputs[path] = file

    # print(outputs)

    return [
        PackageFilesInfo(
            attributes = {},
            dest_src_map = outputs,
        ),
        DefaultInfo(
            files = depset([], transitive = transitive),
        ),
    ]

pkg_headers = rule(
    implementation = _pkg_headers,
    attrs = {
        "deps": attr.label_list(
            aspects = [library_public_headers],
            mandatory = True,
        ),
        "mappings": attr.string_dict(),
        "prefix": attr.string(default = "include"),
    },
)

def _caffeine_naming(ctx):
    values = {}

    values["cpu"] = ctx.var.get("TARGET_CPU")
    values["mode"] = ctx.var.get("COMPILATION_MODE")

    return [PackageVariablesInfo(values = values)]

caffeine_naming = rule(
    implementation = _caffeine_naming,
    attrs = {},
)
