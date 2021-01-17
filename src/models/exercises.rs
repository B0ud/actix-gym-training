use anyhow::Result;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};
use sqlx::{FromRow, PgPool};
use uuid::Uuid;

// this struct will be used to represent database record
#[derive(Serialize, FromRow, Deserialize)]
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

// this struct will use to receive user input
#[derive(Serialize, Deserialize)]
pub struct ExerciseRequest {
    pub name: String,
    pub description: Option<String>,
    pub category: String,
    pub category_icon: Option<String>,
    pub image: Option<String>,
}

// this struct will use to receive user input
#[derive(Serialize,Deserialize)]
pub struct IdResponse {
    pub id: Uuid,
}

// Implementation for Exercise struct, functions for read/write/update and delete exercises from database
impl Exercise {
    pub async fn find_by_id(id: Uuid, pool: &PgPool) -> Result<Exercise> {
        let rec = sqlx::query!(
            r#"
                    SELECT * FROM exercise WHERE exercise_id = $1
                "#,
            id
        )
        .fetch_one(&*pool)
        .await?;

        Ok(Exercise {
            id: rec.exercise_id,
            name: rec.name,
            description: rec.description,
            category: rec.category,
            category_icon: rec.category_icon,
            image: rec.image,
            created_at: rec.created_at,
            updated_at: rec.updated_at,
        })
    }

    pub async fn find_all(pool: &PgPool) -> Result<Vec<Exercise>> {
        let mut exercises = vec![];
        let recs = sqlx::query!(
            r#"
                    SELECT * FROM exercise ORDER BY name
                "#
        )
        .fetch_all(&*pool)
        .await?;

        for rec in recs {
            exercises.push(Exercise {
                id: rec.exercise_id,
                name: rec.name,
                description: rec.description,
                category: rec.category,
                category_icon: rec.category_icon,
                image: rec.image,
                created_at: rec.created_at,
                updated_at: rec.updated_at,
            });
        }
        Ok(exercises)
    }

    pub async fn create(exercise: ExerciseRequest, pool: &PgPool) -> Result<IdResponse> {
        let rec = sqlx::query!(
            r#"
                     INSERT INTO exercise(name, description, category, category_icon, image) VALUES ($1, $2, $3, $4, $5) RETURNING exercise_id
                "#,
            exercise.name, exercise.description, exercise.category, exercise.category_icon, exercise.image,
        )
            .fetch_one(&*pool)
            .await?;

        Ok(IdResponse {
            id: rec.exercise_id,
        })
    }
}
