set -ex

run() {
    local src_dir=$(pwd) \
          stage=

    case $TRAVIS_OS_NAME in
        linux)
            stage=$(mktemp -d)
            ;;
        osx)
            stage=$(mktemp -d -t tmp)
            ;;
    esac

    cp target/$TARGET/release/hello $stage/

    cd $stage
    tar czf $src_dir/$CRATE_NAME-$TRAVIS_TAG-$TARGET.tar.gz *
    cd $src_dir

    rm -rf $stage
}

run
