set -ex

run() {
    local target=$1

    cargo test --target $target
    cargo test --target $target --release
    cargo run --target $target
    cargo run --target $target --release
}

run $1
