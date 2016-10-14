FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc \
    gcc-arm-linux-gnueabihf \
    libc6-dev \
    qemu-user-static
ENV CARGO_TARGET_ARMV7_UNKNOWN_LINUX_MUSLEABIHF_LINKER=arm-linux-gnueabihf-gcc \
    RUST_TEST_THREADS=1
