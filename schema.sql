CREATE TABLE animals (
    ID INTEGER,
    name varchar(100),
    date_of_birth date,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
-- ALTER TABLE ANIMALS
ALTER TABLE animals
ADD column species varchar(100);

--Creating Tables
CREATE TABLE owners(
    id INTEGER,
    full_name VARCHAR(100),
	age INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE species(
   id INTEGER,
   name VARCHAR(100),
   PRIMARY KEY(id)
);

ALTER TABLE animals ADD PRIMARY KEY(id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

--Ceating Vet Table
CREATE TABLE vets (
    id INTEGER,
    name VARCHAR(100),
    age INTEGER,
    date_of_graduation DATE,
    PRIMARY KEY(id)
)

--Create Table Visits

CREATE TABLE visits (
id INTEGER,
animals_id INTEGER,
vets_id INTEGER,
visit_date DATE,
	FOREIGN KEY (vets_id) REFERENCES vets(id),
	FOREIGN KEY (animals_id) REFERENCES animals(id),
	PRIMARY KEY (vets_id,animals_id,visit_date)

);


--Create Specializations Table

CREATE TABLE specializations(
id INTEGER,
Vet_id INTEGER,
Spcs_id INTEGER,
FOREIGN KEY (vet_id) REFERENCES vets (id),
FOREIGN KEY (Spcs_id) REFERENCES species (id),
PRIMARY KEY (vet_id,Spcs_id)
);

--database performance audit

DROP TABLE visits;

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);


CREATE INDEX visits_people ON visits(id ASC);

DROP TABLE owners;

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(20),
  age INT,
  PRIMARY KEY(id)
);

CREATE INDEX owners_users ON owners(id ASC);
