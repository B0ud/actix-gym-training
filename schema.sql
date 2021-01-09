CREATE EXTENSION IF NOT EXISTS "uuid-ossp";




CREATE TABLE MuscleTag (
                             MuscleTagId UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                             Name varchar(50) NOT NULL UNIQUE,
                             Code varchar(50) NOT NULL UNIQUE,
                             Description varchar(50),
                             Image varchar(50),
                             CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                             UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Exercise (
                           ExerciseId UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                           Name varchar(50) NOT NULL UNIQUE,
                           Description varchar(50),
                           Category varchar(50) NOT NULL,
                           CategoryIcon varchar(50),
                           Image varchar(50),
                           CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                           UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE ExerciseMuscleTag (
                                MuscleTagId UUID REFERENCES MuscleTag (MuscleTagId),
                                ExerciseId UUID REFERENCES Exercise(ExerciseId),
                                CONSTRAINT Muscle_Tag_Exercice_pk PRIMARY KEY (ExerciseId, MuscleTagId)
);

CREATE TABLE Workout
(
    WorkoutId UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "Date"    date DEFAULT CURRENT_DATE NOT NULL,
    "Type"      varchar(50) NOT NULL
);

CREATE TABLE WorkoutRep
(
    WorkoutRepId     UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ExerciseId       UUID REFERENCES Exercise (ExerciseId) NOT NULL,
    WorkoutId        UUID REFERENCES Workout (WorkoutId) NOT NULL,
    Rep              Integer NOT NULL,
    DropSetRep       Integer NULL,
    Weight           Numeric NOT NULL,
    WeightDropSetRep Numeric NULL
);




