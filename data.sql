

-- muscle tags

INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Pectoraux', 'PECS', 'Exercices pour les pectoraux', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Deltoides', 'DELTOIDES', 'Exercices pour les deltoides', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Abdominaux', 'ABDOS', 'Exercices pour les abdominaux', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Quadriceps', 'QUADRIS', 'Exercices pour les quadriceps', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Biceps', 'BICEPS', 'Exercices pour les biceps', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Avants-bras', 'AVANTS-BRAS', 'Exercices pour les avants-bras', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Trapezes', 'TRAPEZES', 'Exercices pour les trapezes', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Lombaires', 'LOMBAIRES', 'Exercices pour les lombaires', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Ischios', 'ISCHIOS', 'Exercices pour les ischios', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Dorsaux', 'DORSAUX', 'Exercices pour les dorsaux', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Fessiers', 'FESSIERS', 'Exercices pour les fessiers', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO public.muscle_tag (muscle_tag_id, "name", code, description, image, created_at, updated_at) VALUES(uuid_generate_v4(), 'Mollets', 'MOLLETS', 'Exercices pour les mollets', NULL,  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- exercises


--PECS

-- Basic
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé assis à la machine convergente',NULL,'EXERCICES DE BASE','*',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé couché',NULL,'EXERCICES DE BASE','*',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé couché avec haltères',NULL,'EXERCICES DE BASE','*',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé couché à la machine convergente',NULL,'EXERCICES DE BASE','*',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé décliné',NULL,'EXERCICES DE BASE','*',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé décliné avec haltères',NULL,'EXERCICES DE BASE','*',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé incliné',NULL,'EXERCICES DE BASE','*',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé incliné avec haltères',NULL,'EXERCICES DE BASE','*',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- Avances
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Écarté à la machine',NULL,'EXERCICES AVANCES','**',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Écarté couché',NULL,'EXERCICES AVANCES','**',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Écarté décliné',NULL,'EXERCICES AVANCES','**',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Écarté incliné',NULL,'EXERCICES AVANCES','**',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Pompes prise large',NULL,'EXERCICES AVANCES','**',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Pull over à la poulie basse',NULL,'EXERCICES AVANCES','**',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- Finition

INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Écarté à la poulie vis à vis basse',NULL,'EXERCICES DE FINITION','***',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Écarté à la poulie vis à vis haute',NULL,'EXERCICES DE FINITION','***',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Développé couché à la machine',NULL,'EXERCICES DE FINITION','***',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO public.exercise(exercise_id, "name", description, category, category_icon, image, created_at, updated_at) VALUES (uuid_generate_v4(),'Étirement des pectoraux (ceinture thoracique)',NULL,'EXERCICES DE FINITION','***',NULL,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);


-- basic asso
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé assis à la machine convergente'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé couché'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé couché avec haltères'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé couché à la machine convergente'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé décliné'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé décliné avec haltères'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé incliné'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé incliné avec haltères'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');

-- avance asso

INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Écarté à la machine'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Écarté couché'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Écarté décliné'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Écarté incliné'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Pompes prise large'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Pull over à la poulie basse'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');

--finition asso


INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Écarté à la poulie vis à vis basse'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Écarté à la poulie vis à vis haute'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Développé couché à la machine'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');
INSERT INTO public.exercise_muscle_tag(exercise_id, muscle_tag_id) SELECT (SELECT exercise_id from  public.exercise WHERE "name" = 'Étirement des pectoraux (ceinture thoracique)'), (SELECT muscle_tag_id from public.muscle_tag WHERE "name" = 'Pectoraux');

