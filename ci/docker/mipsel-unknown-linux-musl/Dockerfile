FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bzip2 \
    ca-certificates \
    curl \
    gcc \
    libc6-dev \
    qemu-user-static
RUN mkdir /openwrt && \
    curl -L https://downloads.openwrt.org/snapshots/trunk/malta/generic/OpenWrt-SDK-malta-le_gcc-5.3.0_musl-1.1.15.Linux-x86_64.tar.bz2 | \
    tar -jx --strip-components 1 -C /openwrt
ENV CARGO_TARGET_MIPSEL_UNKNOWN_LINUX_MUSL_LINKER=mipsel-openwrt-linux-gcc \
    CC_mipsel_unknown_linux_musl=mipsel-openwrt-linux-gcc \
    PATH=$PATH:/openwrt/staging_dir/toolchain-mipsel_24kc_gcc-5.3.0_musl-1.1.15/bin \
    QEMU_LD_PREFIX=/openwrt/staging_dir/toolchain-mipsel_24kc_gcc-5.3.0_musl-1.1.15
