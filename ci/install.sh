set -ex

main() {
    curl https://sh.rustup.rs -sSf | \
        sh -s -- -y --default-toolchain $TRAVIS_RUST_VERSION

    local target=
    if [ $TRAVIS_OS_NAME = linux ]; then
        target=$TARGET_DEFAULT_LINUX
        sort=sort
    else
        target=$TARGET_DEFAULT_OSX
        sort=gsort  # for `sort --sort-version`, from brew's coreutils.
    fi

    # This fetches latest stable release
    local tag=$(git ls-remote --tags --refs --exit-code https://github.com/japaric/cross \
                       | cut -d/ -f3 \
                       | grep -E '^v[0-9.]+$' \
                       | $sort --version-sort \
                       | tail -n1)
    echo cross version: $tag
    curl -LSfs https://japaric.github.io/trust/install.sh | \
        sh -s -- \
           --force \
           --git japaric/cross \
           --tag $tag \
           --target $target
}

main
