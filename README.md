# Caffeine - Prototype Symbolic Execution Engine

Caffeine is a [symbolic execution engine](https://en.wikipedia.org/wiki/Symbolic_execution)
that interprets LLVM IR. Caffeine currently supports `C` and `C++` (if no exceptions are
thrown, see [#458](https://github.com/insufficiently-caffeinated/caffeine/issues/458)).
In general, Caffeine can support any language that compiles down to LLVM IR provided
that the resulting IR does not use unimplemented functions or instructions.

# Building and Installing
As of yet, there are no binary releases of caffeine so it must be built and
installed from source. Note, however, that the build system is only tested on
linux so it may not work on other OSes (MacOS is a maybe, Windows most likely
not).

In order to build caffeine you will need the following
- A C++ compiler which supports C++17, and
- Bazel 5.0. See the [instructions here](https://bazel.build/install) on how
  to install bazel.

Once you have those you can build and install caffeine by running
```sh
bazel run -c opt //:install -- --destdir=<path/to/some/dir>
```
which will build and install caffeine and all its dependencies to the specified
directory. Note that this has to build LLVM so it will take a while. If you're
trying to install caffeine globally then passing `--destdir=/usr/local` will
work provided the command is invoked with admin priviledges.

## Running Caffeine
Once caffeine is installed, it will be available under `<prefix>/bin/caffeine`.
See `caffeine --help` to get started. There are also some examples provided
under the `bench` directory that can be built via bazel. For instance:
```sh
caffeine bazel-bin/bench/bench-maze.ll
```
