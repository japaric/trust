pub fn hello() {
    extern {
        fn hello();
    }

    unsafe {
        hello()
    }
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {}
}
