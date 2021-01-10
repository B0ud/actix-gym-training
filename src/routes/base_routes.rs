use actix_web::{get, web, HttpResponse, Responder};
use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize, Serialize, PartialEq)]
pub struct HealthResponse {
    pub status: String,
    pub version: String,
}

#[get("/health")]
async fn get_health() -> impl Responder {
    HttpResponse::Ok().json(HealthResponse {
        status: "ok".into(),
        version: env!("CARGO_PKG_VERSION").into(),
    })
}

// function that will be called on new Application to configure routes for this module
pub fn base_route(cfg: &mut web::ServiceConfig) {
    cfg.service(get_health);
}

#[cfg(test)]
mod tests {
    use super::*;
    use actix_web::{test, App};

    #[actix_rt::test]
    async fn test_get_health() {
        let mut app = test::init_service(App::new().configure(base_route)).await;

        let req = test::TestRequest::get().uri("/health").to_request();
        let resp = test::call_service(&mut app, req).await;
        assert!(resp.status().is_success());
    }
}
