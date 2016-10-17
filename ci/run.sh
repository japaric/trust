set -ex

test_mode() {
    case $TARGET in
        thumbv*-none-eabi*)
            xargo build $flags
            xargo build $flags --release
            ;;
        *)
            cargo build $flags
            cargo build $flags --release
            ;;
    esac

    case $TARGET in
        thumbv*-none-eabi*)
            ;;
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
    case $TARGET in
        thumbv*-none-eabi*)
            xargo rustc $flags --release --bin hello -- -C lto
            ;;
        *)
            cargo rustc $flags --release --bin hello -- -C lto
            ;;
    esac
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
    elif [ $TRAVIS_RUST_VERSION = $DEPLOY_VERSION ]; then
        deploy_mode
    fi
}

run
