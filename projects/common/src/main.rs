mod random;

extern crate libc;

use std::ffi::CStr;
use std::str;

use axum::response::Html;
use axum::routing::get;
use handlebars::Handlebars;
use libc::c_char;
use serde_json::json;

async fn index() -> Result<Html<String>, String> {
    let mut reg = Handlebars::new();
    let result = reg.render_template("Hello {{name}}", &json!({"name": "World"})).map_err(|err| err.to_string())?;
    println!(
        "{}",
        result
    );

    reg.register_template_string("tpl_1", "Good afternoon, {{name}}").map_err(|err| err.to_string())?;
    let result2 = reg.render("tpl_1", &json!({"name": "World"})).map_err(|err| err.to_string())?;
    println!("{}", result2);

    let html = result + "\n" + result2.as_str();

    Ok(Html(html))
}

async fn main() {
    let result = random::random_string(16, false,
                                       false, false, false);

    println!("value: {}", result);
}
