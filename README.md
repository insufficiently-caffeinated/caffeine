# Caffeine - Prototype Symbolic Execution Engine

## Getting Dependencies

You'll need to set the `CMAKE_TOOLCHAIN_FILE` variable according to your
vscode install directory. Once that's done you can just run cmake as you
would normally to generate your build system.

The first build will take a while as it's going to build all the dependencies
and install them within a `vcpkg_installed` directory within the repo folder.
Once that's done you shouldn't have to worry about it anymore.

## Installation instructions

### macOS

- Install homebrew
  - Follow the instructions at <https://brew.sh>
- Install dependencies with homebrew
  - `brew update && brew install cmake boost llvm fmt z3 capnp pkg-config`
- Install gtest
  - `git clone https://github.com/google/googletest` or `git clone git@github.com:google/googletest.git`
  - `cd googletest`
  - `mkdir build`
  - `cd build`
  - `cmake ..`
  - `make`
  - `make install`
- Run cmake and make
  - Navigate to the project's root directory
  - `mkdir build`
  - `cd build`
  - `LLVM_DIR=$(brew --prefix llvm)`
  - `cmake .. "-DLLVM_DIR=${LLVM_DIR}/lib/cmake/llvm/" "-DCMAKE_C_COMPILER=${LLVM_DIR}/bin/clang" "-DCMAKE_CXX_COMPILER=${LLVM_DIR}/bin/clang++"`
  - Add the output of `brew --prefix llvm` to your `PATH`
  - `make`
