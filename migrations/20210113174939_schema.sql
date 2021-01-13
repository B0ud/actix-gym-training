-- Add migration script here
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";




CREATE TABLE Muscle_Tag (
                            Muscle_Tag_Id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                            Name varchar(50) NOT NULL UNIQUE,
                            Code varchar(50) NOT NULL UNIQUE,
                            Description varchar(50),
                            Image varchar(50),
                            Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                            Updated_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Exercise (
                          Exercise_Id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                          Name varchar(50) NOT NULL UNIQUE,
                          Description varchar(50),
                          Category varchar(50) NOT NULL,
                          Category_Icon varchar(50),
                          Image varchar(50),
                          Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                          Updated_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Exercise_Muscle_Tag (
                                     Exercise_Id UUID REFERENCES Exercise(Exercise_Id),
                                     Muscle_Tag_Id UUID REFERENCES Muscle_Tag (Muscle_Tag_Id),
                                     CONSTRAINT Muscle_Tag_Exercice_pk PRIMARY KEY (Exercise_Id, Muscle_Tag_Id)
);

CREATE TABLE Workout
(
    Workout_Id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "Date"    date DEFAULT CURRENT_DATE NOT NULL,
    "Type"      varchar(50) NOT NULL
);

CREATE TABLE Workout_Rep
(
    Workout_Rep_Id     UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    Exercise_Id       UUID REFERENCES Exercise (Exercise_Id) NOT NULL,
    Workout_Id        UUID REFERENCES Workout (Workout_Id) NOT NULL,
    Rep              Integer NOT NULL,
    DropS_et_Rep       Integer NULL,
    Weight           Numeric NOT NULL,
    Weight_Drop_Set_Rep Numeric NULL
);




