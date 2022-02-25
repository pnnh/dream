use std::error::Error;

use axum::{
    Router,
    routing::get,
};
use axum::response::Html;
use handlebars::Handlebars;
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

#[tokio::main]
async fn main() {
    let app = axum::Router::new().route("/", axum::routing::get(|| async { "Hello, World!" }))
        .route("/html", get(index));

    axum::Server::bind(&"0.0.0.0:3000".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}