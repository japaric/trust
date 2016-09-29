set -ex

run() {
    echo $1

    docker build -t rust ci/docker/$1
    docker run \
           -e CARGO_HOME=/cargo \
           -e CARGO_TARGET_DIR=/target \
           -v $HOME/.cargo:/cargo \
           -v `pwd`/target:/target \
           -v `pwd`:/checkout:ro \
           -v `rustc --print sysroot`:/rust:ro \
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
