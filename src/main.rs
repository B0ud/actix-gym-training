mod config;
mod models;
mod routes;

use actix_web::{get, post, web, App, Error, HttpResponse, HttpServer, Responder};
use anyhow::Result;
use dotenv::dotenv;
use env_logger::{Env, Target};
use futures::{future::ok, stream::once};
use listenfd::ListenFd;
use log::info;
use std::env;

#[get("/")]
async fn hello() -> impl Responder {
    info!(" [GET] /hello");
    HttpResponse::Ok()
        .body("Hello world! 🙈🙉🙊")
        .with_header("Content-type", "text/html; charset=utf-8")
}

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok().body(req_body)
}

#[get("/stream")]
async fn stream() -> HttpResponse {
    let body = once(ok::<_, Error>(web::Bytes::from_static(b"test")));

    HttpResponse::Ok()
        .content_type("application/json")
        .streaming(body)
}

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().body("Hey there!")
}

#[actix_web::main]
async fn main() -> Result<()> {
    dotenv().ok();

    env_logger::Builder::from_env(Env::default().default_filter_or("info"))
        .target(Target::Stdout)
        .init();

    // this will enable us to keep application running during recompile: systemfd --no-pid -s http::5000 -- cargo watch -x run
    let mut listenfd = ListenFd::from_env();

    let db_pool = config::get_db_pool().await?;

    info!("Starting up");

    let mut server = HttpServer::new(move || {
        App::new()
            .data(db_pool.clone())
            .service(hello)
            .service(echo)
            .service(stream)
            .route("/hey", web::get().to(manual_hello))
            .configure(routes::init)
            .configure(routes::base_route)
    });

    server = if let Some(listener) = listenfd.take_tcp_listener(0)? {
        server.listen(listener).unwrap()
    } else {
        let host = env::var("HOST").expect("HOST is not set in .env file");
        let port = env::var("PORT").expect("PORT is not set in .env file");
        server.bind(format!("{}:{}", host, port))?
    };

    server.run().await?;

    Ok(())
}
