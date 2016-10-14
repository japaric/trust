FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc \
    gcc-powerpc64-linux-gnu \
    libc6-dev \
    libc6-dev-ppc64-cross \
    qemu-system-ppc \
    qemu-user-static
ENV CARGO_TARGET_POWERPC64_UNKNOWN_LINUX_GNU_LINKER=powerpc64-linux-gnu-gcc \
    CC_powerpc64_unknown_linux_gnu=powerpc64-linux-gnu-gcc \
    QEMU_LD_PREFIX=/usr/powerpc64-linux-gnu \
    RUST_TEST_THREADS=1
