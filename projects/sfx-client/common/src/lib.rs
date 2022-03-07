extern crate wasm_bindgen;

use wasm_bindgen::prelude::*;

#[wasm_bindgen]
extern {
    pub fn alert(s: &str);
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