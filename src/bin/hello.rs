#![cfg_attr(thumb, feature(lang_items))]
#![cfg_attr(thumb, no_main)]
#![cfg_attr(thumb, no_std)]

extern crate trust;

#[cfg(not(thumb))]
fn main() {
    println!(concat!("target: ",
                     include_str!(concat!(env!("OUT_DIR"), "/target.txt"))));

    trust::hello();
}

#[cfg(thumb)]
#[no_mangle]
pub fn _start() -> ! {
    loop {}
}

#[cfg(thumb)]
#[no_mangle]
pub fn __aeabi_unwind_cpp_pr0() {}

#[cfg(thumb)]
#[lang = "panic_fmt"]
fn panic_fmt() {}
