# Caffeine - Prototype Symbolic Execution Engine

Caffeine is a [symbolic execution engine](https://en.wikipedia.org/wiki/Symbolic_execution)
that interprets LLVM IR. Caffeine currently supports `C` and `C++` (if no exceptions are
thrown, see [#458](https://github.com/insufficiently-caffeinated/caffeine/issues/458)).
In general, Caffeine can support any language that compiles down to LLVM IR provided
that the resulting IR does not use unimplemented functions or instructions.

## Getting Dependencies

You'll need to set the `CMAKE_TOOLCHAIN_FILE` variable according to your
vscode install directory. Once that's done you can just run cmake as you
would normally to generate your build system.

The first build will take a while as it's going to build all the dependencies
and install them within a `vcpkg_installed` directory within the repo folder.
Once that's done you shouldn't have to worry about it anymore.

## Debugging
Running with TSAN can help detect a bunch of bugs in your code. To configure
your build to run with TSAN do:
```
CC=clang-11 CXX=clang++-11 cmake -DCAFFEINE_ENABLE_TSAN=ON ..
```

It's also possible to specify UBSAN, ASAN, and others with the following flags:
* `CAFFEINE_ENABLE_ASAN`
* `CAFFEINE_ENABLE_UBSAN`
* `CAFFEINE_ENABLE_MSAN`

## Installation instructions

### Ubuntu
- Install the dependencies
```
apt-get update \
    && apt-get -y install \
        llvm-11-dev \
        clang-11 \
        libz-dev \
        build-essential \
        gcc-9 \
        g++-9 \
        git \
        make \
        cmake \
        libgtest-dev \
        python3-distutils \
        libfmt-dev \
        libboost-all-dev \
        libcapnp-dev \
        capnproto \
        pkg-config \
        jq
```
- Run cmake and make
  - Navigate to the project's root directory
  - `mkdir build`
  - `cd build`
  - `cmake ..`
  - `make`

## Running Caffeine

After building Caffeine, it's possible to run the binary `build/caffeine`. See
`caffeine --help` to get started. There are also some examples that can be run
under the `build/bench/` directory. For instance:

```bash
cd build/
./caffeine bench/bench-maze.ll
```
