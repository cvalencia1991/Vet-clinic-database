INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (1,
'Agumon', '2020-02-03',0,true,10.23);

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (2,
'Gabumon', '2018-11-15',2,true,8);

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (3,
'Pikachu', '2021-06-07',1,false,15.04);

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (4,
'Devimon', '2017-05-12',5,true,11);


-- Adding Info data

UPDATE animals
SET name = 'Charmander',
date_of_birth = '2020-02-08',escape_attempts=0,
neutered=false,weight_kg=-11
WHERE id=1;

UPDATE animals
SET name = 'Plantom',
date_of_birth = '2021-11-15',escape_attempts=2,
neutered=true,weight_kg=-5.7
WHERE id=2;

UPDATE animals
SET name = 'Squirtle',
date_of_birth = '1993-04-02',escape_attempts=3,
neutered=false,weight_kg=-12.13
WHERE id=3;

UPDATE animals
SET name = 'Angemon',
date_of_birth = '2005-06-12',escape_attempts=1,
neutered=true,weight_kg=20.4
WHERE id=4;

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (5,
'Boarmon', '2005-06-07',7,true,20.4);

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (6,
'Blossom', '1998-10-13',3,true,17);

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (7,
'Ditto', '2022-05-14',4,true,22);


