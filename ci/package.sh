set -ex

run() {
    local src_dir=$(pwd)\
          stage=$(mk_temp_dir)
    
    cp target/release/$TARGET/hello $stage/

    pushd $stage
    tar czf $src_dir/$CRATE_NAME-$TRAVIS_TAG-$TARGET.tar.gz *
    popd

    rm -rf $stage
}

mk_temp_dir() {
    case $TRAVIS_OS_NAME in
        linux)
            mktemp -d
            ;;
        osx)
            mktemp -d -t tmp
            ;;
    esac
}

run $1
