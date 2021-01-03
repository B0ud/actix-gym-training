use serde::{Serialize, Deserialize};
use actix_web::{HttpResponse, HttpRequest, Responder, Error};
use futures::future::{ready, Ready};
use sqlx::{PgPool, FromRow, Row};
use sqlx::postgres::PgRow;
use anyhow::Result;
use uuid::Uuid;
use chrono::NaiveDateTime;


// this struct will be used to represent database record
#[derive(Serialize, FromRow)]
pub struct Exercise {
    pub id: Uuid,
    pub name: String,
    pub description: Option<String>,
    pub category: String,
    pub category_icon: Option<String>,
    pub image: Option<String>,
    pub created_at: NaiveDateTime,
    pub updated_at: NaiveDateTime,
}


// Implementation for Exercise struct, functions for read/write/update and delete exercises from database
impl Exercise {

    pub async fn find_by_id(id: Uuid, pool: &PgPool) -> Result<Exercise> {
        let rec = sqlx::query!(
                r#"
                    SELECT * FROM exercises WHERE id = $1
                "#,
                id
            )
            .fetch_one(&*pool)
            .await?;

        Ok(Exercise {
            id: rec.id,
            name: rec.name,
            description: rec.description,
            category: rec.category,
            category_icon: rec.category_icon,
            image: rec.image,
            created_at: rec.created_at,
            updated_at: rec.updated_at,
        })
    }

}