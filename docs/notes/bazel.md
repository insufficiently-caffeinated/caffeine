# Working with bazel within the caffeine repo

This document is meant to provide some general guidance on how to work with
the bazel within the caffeine repo. Each section will cover a common task 
that needs to be done for development.

This document is meant to be a living document so if you've found something
that's not on here then feel free to add it!

## General Notes
- If you only want to build a target then you can do `bazel build` instead of
  `bazel test`. `bazel test` will automatically do the build as well but you
  might not necessarily want to run the test in all cases.

## Build and run all tests
```sh
bazel test //...
```

This will build all targets within the caffeine repo and then run all the ones
that are tests. The output from this will also list out the names of all the
individual tests.

## Run only the unit tests
```sh
bazel test //test/unit
```

All the unit tests are in a single binary built as the `//test/unit:unit` target
(bazel allows omitting the `:<target>` part if it matches the folder name).

## Check formatting or apply formatting
```sh
# Verify that all files match the expected formatting and print out a diff
# between the actual and expected file if they do not.
bazel run //:check-format

# Reformat all files to match the expected clang-format style.
bazel run //:format
```

Note that we build `clang-format` from source. If you haven't built either of
the formatting targets it may be faster to use the `format` target from within
the cmake build system. However, they will be built anytime you run
`bazel build //...` or `bazel test //...`.

## Determining the name of a target
Bazel targets are named according to their location within the file system along
with the name passed into a starlark macro within the corresponding `BUILD`
file.

For example, the `//:caffeine` target, which is the caffeine library is defined
in the `BUILD` file at the root of the repository (i.e. `//:BUILD`). It is then
defined by the `cc_library` target within that file which looks something like
this
```python
cc_library(
  name = "caffeine",
  ...
)
```

In general, this all that is needed to find the definition of a target. The main
exception to this within the caffeine repo is the targets for LLVM IR test cases.
These are defined by a macro defined within `//test:tests.bzl` and which is then
invoked within each individual `BUILD` file.
