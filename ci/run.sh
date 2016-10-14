set -ex

test_mode() {
    cargo build $flags
    cargo build $flags --release

    case $TARGET in
        s390x-unknown-linux-gnu)
            cargo test $flags --no-run
            cargo test $flags --no-run --release
            ;;
        *)
            cargo test $flags
            cargo test $flags --release
            cargo run $flags
            cargo run $flags --release
            ;;
    esac
}

deploy_mode() {
    cargo rustc $flags --release --bin hello -- -C lto
}

run() {
    case $TARGET in
        arm*-unknown-linux-musleabi*)
            flags="--no-default-features --target $TARGET"
            ;;
        *)
            flags="--target $TARGET"
            ;;
    esac

    if [ -z $TRAVIS_TAG ]; then
        test_mode
    else
        deploy_mode
    fi
}

run
