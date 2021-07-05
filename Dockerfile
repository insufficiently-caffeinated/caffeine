FROM ubuntu:latest
# This Dockerfile creates https://hub.docker.com/r/insufficientlycaffeinated/bob
# Currently there's no automatic build set up for this, so changes to this file
# should be followed by rebuilding the container and pushing it to dockerhub.
# Luckily that won't happen very often (because changes can be made in Circle
# faster)
ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get -y install \
        llvm-11-dev \
        clang-11 \
        clang-format \
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
        curl \
    && rm -rf /var/lib/apt/lists/*
RUN update-alternatives --install /usr/local/bin/llvm-config llvm-config /usr/bin/llvm-config-11 20 \
    && update-alternatives --install /usr/local/bin/clang++ clang++ /usr/bin/clang-11 20
RUN curl -o go.tar.gz https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -L && rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz \
    && echo 'export PATH=$PATH:/usr/local/go/bin:/root/go/bin' >> /root/.bashrc
RUN /usr/local/go/bin/go install github.com/SRI-CSL/gllvm/cmd/...@v1.3.0
