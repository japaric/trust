# `trust`

> Travis CI and AppVeyor template to test your Rust crate on 5 architectures
> and publish [binary releases] of it for Linux, macOS and Windows

[binary releases]: https://github.com/japaric/trust/releases

### Features

- CI test your crate (library or binary) on Linux, macOS and Windows and on more
  than just the x86 architecture.

- Cargo artifacts are cached and reused between CI builds.

- "Deploys": Publish binary releases of your application by just pushing a new
  (Git) tag.

## Requirements

- Your crate must be hosted on GitHub (free).

- A [Travis CI](https://travis-ci.org/) account (free).

- An [AppVeyor](https://www.appveyor.com/) account (free).

## How-to

### Use this template

Copy the `ci` directory, and the `.travis.yml` and `appveyor.yml` files into the
repository where you host your Rust crate.

You'll have to adjust those files to meet your needs. Just look inside those
files for comments that start with the word `TODO`; they'll tell you want needs
to be changed.

This is an overview of what must / can be changed:

- The GitHub token used for deploys.

- The list of test targets. Trim it down to reduce test times.

- The Rust channel used for testing / deploys.

- The "test phase". Tweak how your crate is tested.

- the "package phase". Tweak what goes into the release tarball / zipfile.

### Generate binary releases

You only need to push an **annotated** tag to kick off the build process.

```
# Optional: Publish a new version of your crate to crates.io
$ cargo publish

$ git tag -a $TAG

$ git push origin $TAG
```

### Use the binary releases on Travis CI

There's
an [`install.sh`](https://github.com/japaric/trust/blob/gh-pages/install.sh)
script that you can use to quickly install a binary release produced using this
CI template.

```
$ curl -LSfs https://japaric.github.io/trust/install.sh | \
    sh -s -- --git japaric/cross
```

For more details about this installation script see `install.sh -h`

## Supported targets

### Linux

Courtesy of [`cross`](https://github.com/japaric/cross).

If you run into any problem with any of these targets, report them
to [`cross`'s issue tracker](https://github.com/japaric/cross/issues) but first
check if using a newer release (see `ci/install.sh`)
would
[fix your problem](https://github.com/japaric/cross/blob/master/CHANGELOG.md).

- `i686-unknown-linux-gnu`

- `i686-unknown-linux-musl`

- `x86_64-unknown-linux-gnu`

- `x86_64-unknown-linux-musl`

- `aarch64-unknown-linux-gnu`

- `armv7-unknown-linux-gnueabihf`

- `mips-unknown-linux-gnu`

- `mips64-unknown-linux-gnuabi64`

- `mips64el-unknown-linux-gnuabi64`

- `mipsel-unknown-linux-gnu`

- `powerpc-unknown-linux-gnu`

- `powerpc64-unknown-linux-gnu`

- `powerpc64le-unknown-linux-gnu`

- `s390x-unknown-linux-gnu`

### macOS

- `i686-apple-darwin`

- `x86_64-apple-darwin`

### Windows (MinGW)

- `i686-pc-windows-gnu`

- `x86_64-pc-windows-gnu`

### Windows (MSVC)

- `i686-pc-windows-msvc`

- `x86_64-pc-windows-msvc`

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
