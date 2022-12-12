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

--Update Information

INSERT INTO owners(id,full_name,age)
VALUES (1,'Sam Smith',34),
	   (2,'Jennifer Orwell',19),
	   (3,'Bob',45),
	   (4,'Melody Pond',77),
	   (5,'Dean Winchester',14),
	   (6,'Jodie Whittaker',38);

INSERT INTO species (id,name)
VALUES (1,'Pokemon'),
        (2,'Digimon');


UPDATE animals
SET species_id = 2
WHERE name Like '%mon'

UPDATE animals
SET species_id=1
WHERE species_id IS NULL;


INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (8,
'Gabumon', '2018-11-15',2,true,8);

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (7,
'Pikachu', '2021-06-07',1,false,15.04);


UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name IN ('Agumon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon','Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon','Boarmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander','Squirtle','Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon','Plantmon');

--Add Vets information

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (9,
'Agumon', '2020-02-03',0,true,10.23);

INSERT INTO animals(ID,name,
date_of_birth,escape_attempts,
neutered,weight_kg) VALUES (10,
'Devimon', '2017-05-12',5,true,11);

--Add specializations Values

INSERT INTO specializations(id,vet_id,spcs_id)
VALUES (1,1,1),
        (2,2,1),
        (3,4,2),
        (4,3,2);


INSERT INTO vets(id,name,age,date_of_graduation)
VALUES (1,'William Tatcher',45,'2000-04-23'),
		(2,'Maisy Smith',26,'2019-06-17'),
		(3,'Stephanie Mendez',64,'1981-05-04'),
		(4,'Jack Harkness',38,'2008-08-06');

--Add Visits Table

INSERT INTO visits(id,
animals_id,vets_id,visit_date)
VALUES (1,9,1,'2020-05-24'),
       (2,9,3,'2020-07-22'),
       (3,8,4,'2021-02-02'),
       (4,7,2,'2020-06-05'),
       (5,7,2,'2020-03-08'),
       (6,7,2,'2020-05-14'),
       (7,10,3,'2021-05-04'),
       (8,1,4,'2021-02-24'),
       (9,2,2,'2019-12-21'),
       (10,2,1,'2020-08-10'),
       (11,2,2,'2021-04-07'),
       (12,3,3,'2019-09-29'),
       (13,4,4,'2020-10-03'),
       (14,4,4,'2020-11-04'),
       (15,5,2,'2019-06-24'),
       (16,5,2,'2019-05-15'),
       (17,5,2,'2020-02-27'),
       (18,5,2,'2020-03-08'),
       (19,5,3,'2020-05-24'),
       (20,5,1,'2021-06-11');

-- database performance audit


--iterate many ass youu get X>1000
INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT * FROM (SELECT id FROM animals) animal_ids,
(SELECT id FROM vets) vets_ids,
generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

DROP TABLE owners CASCADE;

ALTER TABLE owners ADD COLUMN email VARCHAR(120);




insert into owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000), 
'owner_' || generate_series(1,2500000) || '@mail.com';


