use crate::models::Exercise;
use actix_web::{get, web, HttpResponse, Responder};
use log::{error, info};
use sqlx::PgPool;
use uuid::Uuid;

#[get("/exercises/{id}")]
async fn find(id: web::Path<Uuid>, db_pool: web::Data<PgPool>) -> impl Responder {
    info!(" [GET] /exercises/{:?} ", id);
    let result = Exercise::find_by_id(id.into_inner(), db_pool.get_ref()).await;
    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        Err(e) => {
            error!("Error : {:?}", e);
            HttpResponse::BadRequest().body("Exercise not found")
        }
    }
}

#[get("/exercises")]
async fn find_all(db_pool: web::Data<PgPool>) -> impl Responder {
    info!(" [GET] /exercises");
    let result = Exercise::find_all(db_pool.get_ref()).await;
    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        Err(e) => {
            error!("Error : {:?}", e);
            HttpResponse::BadRequest().body("Exercise not found")
        }
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
    use dotenv::dotenv;
    use env_logger::{Target};
    use log::LevelFilter;

    #[actix_rt::test]
    async fn it_test_get_all_exercises() {
        dotenv().ok();
        env_logger::Builder::new()
            .filter(None, LevelFilter::Debug)
            .target(Target::Stdout)
            .init();

        let db_pool = config::get_db_pool().await.unwrap();
        let mut app = test::init_service(App::new().data(db_pool.clone()).configure(init)).await;

        let req = test::TestRequest::get().uri("/exercises").to_request();
        let resp = test::call_service(&mut app, req).await;
        println!(" Response : {:?}", resp);
        assert!(resp.status().is_success());
    }
}
