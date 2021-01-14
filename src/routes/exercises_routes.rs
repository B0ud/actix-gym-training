use crate::models::{Exercise, ExerciseRequest};
use actix_web::{get, post, web, HttpResponse, Responder};
use log::{error, info};
use sqlx::PgPool;
use uuid::Uuid;

#[get("/exercise/{id}")]
async fn find(id: web::Path<Uuid>, db_pool: web::Data<PgPool>) -> impl Responder {
    info!(" [GET] /exercises/{:?} ", id);
    let result = Exercise::find_by_id(id.into_inner(), db_pool.get_ref()).await;
    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        Err(e) => {
            error!("Error : {:?}", e);
            HttpResponse::NotFound().body("Exercise not found")
        }
    }
}

#[post("/exercise")]
async fn create(
    exercise: web::Json<ExerciseRequest>,
    db_pool: web::Data<PgPool>,
) -> impl Responder {
    info!(" [POST] /exercise ");
    let result = Exercise::create(exercise.into_inner(), db_pool.get_ref()).await;
    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        Err(e) => {
            error!("Error : {:?}", e);
            HttpResponse::NotFound().body("Error during creation")
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
    cfg.service(create);
}
#[cfg(test)]
mod tests {
    use super::*;
    use crate::config;
    use actix_web::{http, test, web::Bytes, App};
    use dotenv::dotenv;
    use env_logger::Target;
    use log::LevelFilter;
    use sqlx::{Pool, Postgres};
    use std::sync::Once;
    static INIT: Once = Once::new();

    pub async fn database_log_setup() -> Pool<Postgres> {
        INIT.call_once(|| {
            dotenv().ok();
            env_logger::Builder::new()
                .filter(None, LevelFilter::Debug)
                .target(Target::Stdout)
                .init()
        });

        let db_pool = config::get_db_pool().await.unwrap();
        db_pool
    }

    #[actix_rt::test]
    async fn it_test_get_all_exercises() {
        let db_pool = database_log_setup().await;
        let mut app = test::init_service(App::new().data(db_pool.clone()).configure(init)).await;

        let req = test::TestRequest::get().uri("/exercises").to_request();
        let resp = test::call_service(&mut app, req).await;
        println!(" Response : {:?}", resp);
        assert!(resp.status().is_success());
    }

    #[actix_rt::test]
    async fn it_test_get_one_exercise_by_invalid_uuid() {
        let db_pool = database_log_setup().await;
        let mut app = test::init_service(App::new().data(db_pool.clone()).configure(init)).await;

        let req = test::TestRequest::get()
            .uri("/exercises/wrong-id")
            .to_request();
        let resp = test::call_service(&mut app, req).await;

        assert_eq!(resp.status(), http::StatusCode::NOT_FOUND);
        let body = test::read_body(resp).await;
        //println!(" Response : {:?}", resp);

        assert_eq!(
            body,
            Bytes::from_static(b"invalid length: expected one of [36, 32], found 8")
        );
    }

    #[actix_rt::test]
    async fn it_test_get_one_exercise_by_not_found_id() {
        let db_pool = database_log_setup().await;
        let mut app = test::init_service(App::new().data(db_pool.clone()).configure(init)).await;

        let req = test::TestRequest::get()
            .uri("/exercises/f4fd5306-0fc1-44c7-a680-333333333333")
            .to_request();
        let resp = test::call_service(&mut app, req).await;

        assert_eq!(resp.status(), http::StatusCode::NOT_FOUND);
        let body = test::read_body(resp).await;
        //println!(" Response : {:?}", resp);

        assert_eq!(body, Bytes::from_static(b"Exercise not found"));
    }
}
