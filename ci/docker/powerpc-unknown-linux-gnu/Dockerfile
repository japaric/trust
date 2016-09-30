FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc \
    gcc-powerpc-linux-gnu \
    libc6-dev \
    libc6-dev-powerpc-cross \
    qemu-user-static
ENV CARGO_TARGET_POWERPC_UNKNOWN_LINUX_GNU_LINKER=powerpc-linux-gnu-gcc \
    QEMU_LD_PREFIX=/usr/powerpc-linux-gnu \
    RUST_TEST_THREADS=1
