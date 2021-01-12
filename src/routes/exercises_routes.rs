use crate::models::Exercise;
use actix_web::{get, web, HttpResponse, Responder};
use sqlx::PgPool;
use uuid::Uuid;

#[get("/exercises/{id}")]
async fn find(id: web::Path<Uuid>, db_pool: web::Data<PgPool>) -> impl Responder {
    let result = Exercise::find_by_id(id.into_inner(), db_pool.get_ref()).await;
    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        _ => HttpResponse::BadRequest().body("Exercise not found"),
    }
}

#[get("/exercises")]
async fn find_all(db_pool: web::Data<PgPool>) -> impl Responder {
    let result = Exercise::find_all(db_pool.get_ref()).await;
    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        _ => HttpResponse::BadRequest().body("Exercise not found"),
    }
}

// function that will be called on new Application to configure routes for this module
pub fn init(cfg: &mut web::ServiceConfig) {
    cfg.service(find);
    cfg.service(find_all);
}
#[cfg(test)]
mod tests {
    use super::*;
    use crate::config;
    use actix_web::{test, App};

    #[actix_rt::test]
    async fn test_get_all_exercises() {
        let db_pool = config::get_db_pool().await.unwrap();
        let mut app = test::init_service(App::new().data(db_pool.clone()).configure(init)).await;

        let req = test::TestRequest::get().uri("/exercises").to_request();
        let resp = test::call_service(&mut app, req).await;
        println!("{:?}", resp);
        assert!(resp.status().is_success());
    }
}
