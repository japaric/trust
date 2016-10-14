extern crate trust;

fn main() {
    println!(concat!("target: ",
                     include_str!(concat!(env!("OUT_DIR"), "/target.txt"))));

    trust::hello();
}
