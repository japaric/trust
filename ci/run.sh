set -ex

run() {
    local target=$1

    case $target in
        powerpc64le-unknown-linux-gnu)
            cargo test --target $target --no-run
            ;;
        *)
            cargo test --target $target
            cargo test --target $target --release
            cargo run --target $target
            cargo run --target $target --release
            ;;
    esac
}

run $1
