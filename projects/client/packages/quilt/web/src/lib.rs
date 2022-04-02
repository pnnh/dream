use common;

use wasm_bindgen::prelude::*;

extern crate wasm_bindgen;
extern crate js_sys;
extern crate web_sys;

#[wasm_bindgen]
pub fn greet(name: &str) -> String {
    format!("Hello, {}!", name)
}

#[wasm_bindgen]
pub fn excited_greeting(original: &str) -> String {
    format!("HELLO, {}", original.to_uppercase())
}

#[wasm_bindgen]
pub fn random_password(length: u32, has_number: bool, has_letter: bool,
                     has_uppercase: bool, has_symbol: bool) -> String {
    common::random_string(length, has_number, has_letter, has_uppercase, has_symbol)
}
