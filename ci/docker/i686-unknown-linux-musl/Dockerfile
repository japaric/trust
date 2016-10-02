FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc-multilib \
    musl-tools
ENV CARGO_TARGET_I686_UNKNOWN_LINUX_MUSL_LINKER=musl-gcc \
    CC_i686_unknown_linux_musl=musl-gcc
