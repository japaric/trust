set -ex

main() {
    local version=0.1.2

    curl https://sh.rustup.rs -sSf | \
        sh -s -- -y --default-toolchain $TRAVIS_RUST_VERSION

    cargo install -f --git https://github.com/japaric/cross

    # if [ $TRAVIS_OS_NAME = linux ]; then
    #     curl -LSfs http://japaric.github.io/trust/install.sh | \
    #         sh -s -- \
    #            --force \
    #            --git japaric/cross \
    #            --tag v$version \
    #            --target x86_64-unknown-linux-musl \
    #            --to ~/.cargo/bin
    # else
    #     cargo install cross -f --vers $version
    # fi
}

main
