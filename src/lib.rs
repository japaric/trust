#![cfg_attr(thumb, no_std)]

#[cfg(feature = "c")]
pub fn hello() {
    extern {
        fn hello();
    }

    unsafe {
        hello()
    }
}

#[cfg(not(feature = "c"))]
pub fn hello() {
    println!("Hello, world!");
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {}

    #[test]
    #[cfg_attr(trust_ci, ignore)]
    fn ignore_in_ci() {
        assert!(false);
    }
}
