#!/usr/bin/env bash

# Use update-alternatives to register all llvm utility versions

version=$1
priority=$2

binaries=(
  config as ar bcanalyzer cov diff dis dwarfdump link mc
  nm objdump ranlib readobj rtdyld size stress symbolizer
  tblgen objcopy strip profdata
)

for bin in ${binaries[@]}; do
  update-alternatives --install /usr/bin/llvm-$bin llvm-$bin /usr/bin/llvm-$bin-$version $priority
done

update-alternatives \
    --verbose \
    --install /usr/bin/clang             clang            /usr/bin/clang-${version} ${priority} \
    --slave   /usr/bin/asan_symbolize    asan_symbolize   /usr/bin/asan_symbolize-${version} \
    --slave   /usr/bin/clang-cpp         clang-cpp        /usr/bin/clang-cpp-${version} \
    --slave   /usr/bin/ld.lld            ld.lld           /usr/bin/ld.lld-${version}

update-alternatives \
    --verbose \
    --install   /usr/bin/clang++           clang++          /usr/bin/clang++-${version} ${priority}

update-alternatives \
    --verbose \
    --install   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-${version} ${priority}
