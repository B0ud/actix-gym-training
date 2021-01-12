//! Manage config
use sqlx::{Error, PgPool, Pool, Postgres};
use std::env;

// Helper for init database Connection pool
pub async fn get_db_pool() -> serde::export::Result<Pool<Postgres>, Error> {
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL is not set in .env file");
    let db_pool = PgPool::connect(&database_url);
    db_pool.await
}
