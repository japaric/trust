extern crate gcc;

use std::env;
use std::fs::File;
use std::io::Write;
use std::path::PathBuf;

fn main() {
    let out_dir = PathBuf::from(env::var_os("OUT_DIR").unwrap());

    File::create(out_dir.join("target.txt"))
        .unwrap()
        .write_all(env::var("TARGET").unwrap().as_bytes())
        .unwrap();

    if env::var_os("CARGO_FEATURE_C").is_some() {
        gcc::compile_library("libhello.a", &["hello.c"]);
    }

    let target = env::var("TARGET").unwrap();

    if target.starts_with("thumb") {
        println!("cargo:rustc-cfg=thumb");
    }
}
