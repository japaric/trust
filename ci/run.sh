set -ex

test_mode() {
    cargo test --target $TARGET
    cargo test --target $TARGET --release

    cargo run --target $TARGET
    cargo run --target $TARGET --release
}

deploy_mode() {
    cargo rustc --target $TARGET --release --bin hello -- -C lto
}

run() {
    if [ -z $TRAVIS_TAG ]; then
        test_mode
    else
        deploy_mode
    fi
}

run
