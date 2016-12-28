# `trust`

## Targets

### Linux

Using [`cross`](https://github.com/japaric/cross)

- `aarch64-unknown-linux-gnu`
- `armv7-unknown-linux-gnueabihf`
- `i686-unknown-linux-gnu`
- `mips-unknown-linux-gnu`
- `mips64-unknown-linux-gnuabi64`
- `mips64el-unknown-linux-gnuabi64`
- `mipsel-unknown-linux-gnu`
- `powerpc-unknown-linux-gnu`
- `powerpc64-unknown-linux-gnu`
- `powerpc64le-unknown-linux-gnu`
- `s390x-unknown-linux-gnu`
- `x86_64-unknown-linux-gnu`
- `x86_64-unknown-linux-musl`

### macOS

- `i686-apple-darwin`
- `x86_64-apple-darwin`

### Windows

- `i586-pc-windows-msvc`
- `i686-pc-windows-gnu`
- `i686-pc-windows-msvc`
- `x86_64-pc-windows-gnu`
- `x86_64-pc-windows-msvc`

## Notes to self

- Deploy only works with annotated tags

- Linux: If testing only, it makes sense to use the latest available QEMU i.e.
  the latest Ubuntu version

- Linux: If building binaries, you want to use the oldest glibc possible for
  maximum compatibility of your binaries; i.e. you want to use the oldest Ubuntu
- Linux: If QEMU is crashing while "cross" testing, the easiest fix is to use a
  newer QEMU

## License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or
  http://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.
