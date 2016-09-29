FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    gcc \
    gcc-arm-linux-gnueabihf \
    libc6-dev-armhf-cross \
    qemu-user-static
ENV PATH=$PATH:/rust/bin \
    CARGO_TARGET_ARM_UNKNOWN_LINUX_GNUEABI_LINKER=arm-linux-gnueabihf-gcc \
    QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf
