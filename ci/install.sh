set -ex

main() {
    curl https://sh.rustup.rs -sSf | \
        sh -s -- -y --default-toolchain $TRAVIS_RUST_VERSION

    local target=
    if [ $TRAVIS_OS_NAME = linux ]; then
        target=x86_64-unknown-linux-gnu
    else
        target=x86_64-apple-darwin
    fi

    local tag="$(git ls-remote --tags --refs --exit-code https://github.com/japaric/cross | cut -d/ -f3 | tail -n1)"
    echo cross version: $tag
    curl -LSfs https://japaric.github.io/trust/install.sh | \
        sh -s -- \
           --force \
           --git japaric/cross \
           --tag $tag \
           --target $target
}

main
