use crate::models::{Exercise};
use actix_web::{delete, get, post, put, web, HttpResponse, Responder};
use sqlx::PgPool;
use uuid::Uuid;

#[get("/exercises/{id}")]
async fn find(id: web::Path<Uuid>, db_pool: web::Data<PgPool>) -> impl Responder {
    let result = Exercise::find_by_id(id.into_inner(), db_pool.get_ref()).await;
    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        _ => HttpResponse::BadRequest().body("Exercise not found")
    }
}


#[get("/exercises")]
async fn find_all( db_pool: web::Data<PgPool>) -> impl Responder {
    let result = Exercise::find_all( db_pool.get_ref()).await;
    match result {
        Ok(exercise) => HttpResponse::Ok().json(exercise),
        _ => HttpResponse::BadRequest().body("Exercise not found")
    }
}


// function that will be called on new Application to configure routes for this module
pub fn init(cfg: &mut web::ServiceConfig) {
    cfg.service(find);
    cfg.service(find_all);
}