#!/bin/sh

set -e

say() {
    echo "install.sh: $1"
}

say_err() {
    say "$1" >&2
}

err() {
    if [ ! -z $td ]; then
        rm -rf $td
    fi

    say_err "ERROR $1"
    exit 1
}

need() {
    if ! command -v $1 > /dev/null 2>&1; then
        err "need $1 (command not found)"
    fi
}

need basename
need curl
need cut
need grep
need install
need mkdir
need mktemp
need rev
need rustc
need tar

force=false
while test $# -gt 1; do
    case $1 in
        --crate)
            crate=$2
            shift
            ;;
        --git)
            git=$2
            shift
            ;;
        --force)
            force=true
            ;;
        --tag)
            tag=$2
            shift
            ;;
        --target)
            target=$2
            shift
            ;;
        --to)
            dest=$2
            shift
            ;;
        *)
            ;;
    esac
    shift
done

if [ -z $git ]; then
    err 'must specify a git repository using `--git`. Example: `install.sh --git japaric/xargo`'
fi

url="https://github.com/$git"
say_err "Git repository: $url"

if [ -z $crate ]; then
    crate=$(echo $git | cut -d'/' -f2)
fi

say_err "Crate: $crate"

url="$url/releases"

if [ -z $tag ]; then
    tag=$(curl -s "$url/latest" | cut -d'"' -f2 | rev | cut -d'/' -f1 | rev)
    say_err "Tag: latest ($tag)"
else
    say_err "Tag: $tag"
fi

if [ -z $target ]; then
    target=$(rustc -Vv | grep host | cut -d' ' -f2)
fi

say_err "Target: $target"

if [ -z $dest ]; then
    dest="$HOME/.cargo/bin"
fi

say_err "Installing to: $dest"

url="$url/download/$tag/$crate-$tag-$target.tar.gz"

td=$(mktemp -d || mktemp -d -t tmp)
curl -sL $url | tar -C $td -xz

for f in $(find $td -type f -executable); do
    fn=$(basename $f)

    if [ -e "$dest/$fn" ] && [ $force = false ]; then
        err "$fn already exists in $dest"
    else
        mkdir -p $dest
        install -m 755 $f $dest
    fi
done

rm -rf $td
