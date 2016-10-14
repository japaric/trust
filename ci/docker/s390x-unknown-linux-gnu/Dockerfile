FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc \
    gcc-s390x-linux-gnu \
    libc6-dev \
    libc6-dev-s390x-cross \
    qemu-user-static
ENV CARGO_TARGET_S390X_UNKNOWN_LINUX_GNU_LINKER=s390x-linux-gnu-gcc \
    CC_s390x_unknown_linux_gnu=s390x-linux-gnu-gcc \
    QEMU_LD_PREFIX=/usr/s390x-linux-gnu \
    RUST_TEST_THREADS=1
