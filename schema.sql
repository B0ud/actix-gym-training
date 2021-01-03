CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE trainings (
                           id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                           name TEXT NOT NULL UNIQUE,
                           description TEXT,
                           image TEXT,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                           updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


CREATE TABLE muscle_tags (
                             id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                             name TEXT NOT NULL UNIQUE,
                             code TEXT NOT NULL UNIQUE,
                             description TEXT,
                             image TEXT,
                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                             updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE exercises (
                           id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                           name TEXT NOT NULL UNIQUE,
                           description TEXT,
                           category TEXT NOT NULL,
                           category_icon TEXT,
                           image TEXT,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                           updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE asso_muscle_tags_exercises (
                                            exercise_id UUID REFERENCES exercises (id),
                                            muscle_tags UUID REFERENCES muscle_tags(id),
                                            CONSTRAINT muscle_tag_exercices_pk PRIMARY KEY (exercise_id, muscle_tags)
);