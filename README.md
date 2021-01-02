<div align="center">
  <h1>Actix-gym-training</h1>
  <p>
    <strong>Rust & Actix Web exploration. Set up of an application that records the series and repetitions of a sports session </strong>
  </p>
  <p>


[![Version](https://img.shields.io/badge/rustc-1.49+-ab6000.svg)](https://blog.rust-lang.org/2020/03/12/Rust-1.46.html)
[![Build Status](https://github.com/B0ud/actix-gym-training/workflows/Rust/badge.svg)](https://github.com/B0ud/actix-gym-training/actions)
[![codecov](https://codecov.io/gh/B0ud/actix-gym-training/branch/master/graph/badge.svg?token=3qdrW1eB9m)](https://codecov.io/gh/B0ud/actix-gym-training)

  </p>
</div>

## Database 

In the past I did a quick test by doing a synchronous implementation : [gym-schedule](https://github.com/B0ud/gym-schedule) with [Diesel](https://github.com/diesel-rs/diesel)

In this second iteration I would like to explore another option: async db adapters

https://github.com/prisma/quaint

### Async Options

We have several example projects showing use of async database adapters:

- SQLx: [https://github.com/actix/examples/tree/master/sqlx_todo](https://github.com/actix/examples/tree/master/sqlx_todo)
- Postgres: [https://github.com/actix/examples/tree/master/async_pg](https://github.com/actix/examples/tree/master/async_pg)
- SQLite: [https://github.com/actix/examples/tree/master/async_db](https://github.com/actix/examples/tree/master/async_db)


- [ ] Test SQLx
- [ ] Test async_pg
- [ ] Test SQLite 

## Features



## Documentation



## Example

Request:

```toml
 curl http://localhost:8080/xxxxxxx
```

Code:

```rust
use actix_web::{get, post, web, App,Error, HttpResponse, HttpServer, Responder};

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello world! 🙈🙉🙊").with_header("Content-type", "text/html; charset=utf-8")
}

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok().body(req_body)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
            .service(echo)
            .service(stream)
            .route("/hey", web::get().to(manual_hello))
    })
        .bind("127.0.0.1:8080")?
        .run()
        .await
}
```

### More examples



## Benchmarks



## License





