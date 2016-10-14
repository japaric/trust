FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc \
    gcc-arm-linux-gnueabi \
    libc6-dev \
    qemu-user-static
ENV CARGO_TARGET_ARM_UNKNOWN_LINUX_MUSLEABI_LINKER=arm-linux-gnueabi-gcc \
    RUST_TEST_THREADS=1
