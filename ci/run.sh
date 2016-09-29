set -ex

cargo test --target $1
cargo run --target $1
