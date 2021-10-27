"""
"""

load("@bazel_skylib//rules:common_settings.bzl", "BuildSettingInfo")

def _configure_file_impl(ctx):
    subs = {}

    for key, val in zip(ctx.attr.keys, ctx.attr.vals):
        setting = val[BuildSettingInfo].value

        if type(setting) == "bool":
            if setting:
                subs.update({
                    "#cmakedefine {}".format(key): "#define {}".format(key),
                    "#cmakedefine01 {}".format(key): "#define {} 1".format(key),
                })
            else:
                subs.update({
                    "#cmakedefine {}".format(key): "/* #define {} */".format(key),
                    "#cmakedefine01 {}".format(key): "#define {} 0".format(key),
                })
        else:
            subs.update({
                "#cmakedefine {}".format(key): "#define {} \"{}\"".format(key, setting),
            })

    ctx.actions.expand_template(
        template = ctx.file.src,
        output = ctx.outputs.out,
        substitutions = subs,
    )

_configure_file = rule(
    implementation = _configure_file_impl,
    attrs = {
        "src": attr.label(allow_single_file = True),
        "out": attr.output(),
        "keys": attr.string_list(),
        "vals": attr.label_list(
            providers = [BuildSettingInfo],
        ),
    },
)

def configure_file(
        name,
        src,
        out,
        config,
        **kwargs):
    """Configure a file similar to how cmake_configure_file would.

    Args:
      name: The name of this rule.
      src: Input file to be configured.
      out: Generated output file.
      config: Dictionary mapping define value to a bazel config value.
      **kwargs: Extra arguments passed directly to the rule.
    """
    keys = []
    vals = []

    for key in config.keys():
        keys.append(key)
        vals.append(config[key])

    _configure_file(
        name = name,
        src = src,
        out = out,
        keys = keys,
        vals = vals,
        **kwargs
    )
