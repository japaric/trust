[![Travis](https://travis-ci.org/japaric/trust.svg?branch=master)](https://travis-ci.org/japaric/trust)
[![Appveyor](https://ci.appveyor.com/api/projects/status/xybgv7qrarp9hmnb?svg=true)](https://ci.appveyor.com/project/japaric/trust)

# `trust`

## Targets

### Linux

Each Linux target is tested inside a Docker container.

| TARGET                            | OS (Ubuntu) | Glibc |
|-----------------------------------|-------------|-------|
| `aarch64-unknown-linux-gnu`       |       14.04 |  2.19 |
| `arm-unknown-linux-gnueabi`       |       12.04 |  2.15 |
| `arm-unknown-linux-gnueabihf`     |       12.04 |  2.15 |
| `arm-unknown-linux-musleabi`      |       12.04 |  2.15 |
| `arm-unknown-linux-musleabihf`    |       12.04 |  2.15 |
| `armv7-unknown-linux-gnueabihf`   |       12.04 |  2.15 |
| `armv7-unknown-linux-musleabihf`  |       12.04 |  2.15 |
| `i586-unknown-linux-gnu`          |       14.04 |  2.19 |
| `i686-unknown-linux-gnu`          |       12.04 |  2.15 |
| `i686-unknown-linux-musl`         |       16.04 |   N/A |
| `mips-unknown-linux-gnu`          |       16.04 |  2.23 |
| `mips64-unknown-linux-gnuabi64`   |       16.04 |  2.23 |
| `mips64el-unknown-linux-gnuabi64` |       16.04 |  2.23 |
| `mipsel-unknown-linux-gnu`        |       16.04 |  2.23 |
| `powerpc-unknown-linux-gnu`       |       14.04 |  2.19 |
| `powerpc64-unknown-linux-gnu`     |       16.04 |  2.23 |
| `powerpc64le-unknown-linux-gnu`   |       16.04 |  2.23 |
| `s390x-unknown-linux-gnu`         |       16.04 |  2.23 |
| `x86_64-unknown-linux-gnu`        |       12.04 |  2.15 |
| `x86_64-unknown-linux-musl`       |       16.04 |   N/A |

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
- Linux: If testing only, it makes sense to use the latest available QEMU i.e. the latest Ubuntu
  version
- Linux: If building binaries, you want to use the oldest glibc possible for maximum compatibility
  of your binaries; i.e. you want to use the oldest Ubuntu
- Linux: If QEMU is crashing while "cross" testing, the easiest fix is to use a newer QEMU

## License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or
  http://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the
work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any
additional terms or conditions.
