/*Queries that provide answers to the questions from all projects.*/

-- Select all animals Like Mon
SELECT * FROM animals WHERE name Like '%mon'

--List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31'

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = true and escape_attempts < 3 ;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name,escape_attempts from animals  WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * from animals WHERE neutered = true;

--Find all animals not named Gabumon.
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights
--  that equals precisely 10.4kg or 17.3kg)
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg<=17.3;

-- Inside a transaction update the animals table by setting the species column to unspecified.
-- Verify that change was made. Then roll back the change and verify that the species
-- columns went back to the state before the transaction.

BEGIN;

UPDATE animals
 SET species='unspecified'
WHERE species IS NULL;

ROLLBACK;

-- Inside a transaction:
BEGIN;
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals
SET species = 'digimon'
WHERE name Like '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals
 SET species='Pokemon'
WHERE species IS NULL;
-- Commit the transaction.
COMMIT;

--Now, take a deep breath and... Inside a transaction delete all records in the animals table,
-- then roll back the transaction.
--After the rollback verify if all records in the animals table still exists.
--After that, you can start breathing as usual ;)

BEGIN;
DROP TABLE animals;
SELECT * FROM animals;
ROLLBACK;


-- Inside a transaction:
BEGIN;
-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals
WHERE date_of_birth > timestamp '2022-01-01 00:00:00';
-- Create a savepoint for the transaction.
SAVEPOINT point1;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg*-1;
-- Rollback to the savepoint
ROLLBACK to savepoint point1;
-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg *-1;
-- Commit transaction
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT MIN(escape_attempts) FROM animals;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT COUNT(neutered) FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT  species,max(weight_kg),min(weight_kg) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT name, AVG(escape_attempts) FROM animals
WHERE  date_of_birth> '1990-01-01 00:00:00' AND date_of_birth < '2000-12-31 12:00:00' GROUP BY name;

--What animals belong to Melody Pond?
SELECT
	   name,
	   full_name
	   FROM animals a
INNER JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT *
FROM animals a
INNER JOIN species s
ON a.species_id = s.id
WHERE s.name='Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT
       name,
       date_of_birth,
       neutered,
       weight_kg,
       full_name,
       age
 FROM animals a
INNER JOIN owners o
ON  o.id = a.owner_id;

--How many animals are there per species?

SELECT COUNT(a.name), s.name
    FROM animals a
    INNER JOIN species s ON a.species_id = s.id
    GROUP BY s.name;

--List all Digimon owned by Jennifer Orwell.

SELECT
	   name,
	   full_name
	   FROM animals a
INNER JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Jennifer Orwell' AND name Like '%mon';

--List all animals owned by Dean Winchester that haven't tried to escape.

SELECT
	   name,
	   full_name
	   FROM animals a
INNER JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' and escape_attempts=0;

--Who owns the most animals?

SELECT o.full_name ,
        COUNT(a.owner_id)
FROM animals a
INNER JOIN owners o ON o.id = a.owner_id
GROUP BY o.full_name;
