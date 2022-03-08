mod random;
extern crate console_error_panic_hook;
extern crate wasm_bindgen;
extern crate rand;
extern crate js_sys;
extern crate web_sys;

use rand::Rng;
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn init_console_error_panic_hook() {
    console_error_panic_hook::set_once();
}

#[wasm_bindgen]
pub fn greet(name: &str) -> String {
    //alert(&format!("Hello, {}!", name));
    format!("Hello, {}!", name)
}

#[wasm_bindgen]
pub fn excited_greeting(original: &str) -> String {
    format!("HELLO, {}", original.to_uppercase())
}

#[wasm_bindgen]
pub fn random_greeting(length: u32) -> u32 {

    let mut rng = rand::thread_rng();
    let n1: u8 = rng.gen();
    let n2: u16 = rng.gen();
    println!("Random u8: {}", n1);
    println!("Random u16: {}", n2);

    web_sys::console::log_1(&"Hello using web-sys".into());

    let js: JsValue = 4.into();
    web_sys::console::log_2(&"Logging arbitrary values looks like".into(), &js);

    rng.gen_range(0..length)
}