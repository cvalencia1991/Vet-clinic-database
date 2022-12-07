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
