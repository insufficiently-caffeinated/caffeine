FROM ubuntu:latest
# This Dockerfile creates https://hub.docker.com/r/insufficientlycaffeinated/bob
# Currently there's no automatic build set up for this, so changes to this file
# should be followed by rebuilding the container and pushing it to dockerhub.
# Luckily that won't happen very often (because changes can be made in Circle
# faster)
ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get -y install \
        llvm-10-dev \
        clang-10 \
        clang++-10 \
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
    && rm -rf /var/lib/apt/lists/*
