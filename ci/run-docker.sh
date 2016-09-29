set -ex

run() {
    echo $1

    docker build -t rust ci/docker/$1
    docker run \
           -v `rustc --print sysroot`:/rust:ro \
           -v `pwd`:/checkout:ro \
           -e CARGO_TARGET_DIR=/tmp/target \
           -w /checkout \
           -it rust \
           sh ci/run.sh $1
}

if [ -z "$1" ]; then
    for d in `ls ci/docker/`; do
        run $d
    done
else
    run $1
fi
