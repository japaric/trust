set -ex

test_mode() {
    cross build --target $TARGET
    cross build --target $TARGET --release

    if [ $TARGET != s390x-unknown-linux-gnu ]; then
        cross test --target $TARGET
        cross test --target $TARGET --release

        cross run --target $TARGET
        cross run --target $TARGET --release
    fi
}

deploy_mode() {
    cross rustc --bin hello --target $TARGET --release -- -C lto
}

main() {
    if [ -z $TRAVIS_TAG ] && [ $TRAVIS_BRANCH != master ] || [ $TRAVIS_EVENT_TYPE = cron ]; then
        cargo generate-lockfile

        if [ -z $TRAVIS_TAG ]; then
            test_mode
        elif [ $TRAVIS_RUST_VERSION = $DEPLOY_VERSION ]; then
            deploy_mode
        fi
    fi
}

main
