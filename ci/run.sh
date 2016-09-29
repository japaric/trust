set -ex

run() {
    local target=$1

    cargo test --target $target
    cargo run --target $target
}

run $1
