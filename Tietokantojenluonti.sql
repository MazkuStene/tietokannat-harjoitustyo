# Taulu käyttäjiä varten
CREATE TABLE IF NOT EXISTS person (
	personID INT NOT NULL AUTO_INCREMENT,
    nickname VARCHAR (45) NOT NULL,
    birthday DATE,
    height INT,
    PRIMARY KEY (personID)
);
# Taulu painokirjauksia varten
CREATE TABLE IF NOT EXISTS weightEntry (
	weightEntryID INT NOT NULL AUTO_INCREMENT,
	weight INT,
    dateAndTime DATETIME,
    personID INT,
    PRIMARY KEY (weightEntryID),
    CONSTRAINT fk_weightEntry_person
		FOREIGN KEY (personID)
		REFERENCES person(personID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
# Taulu aterioita varten
CREATE TABLE IF NOT EXISTS meal (
	mealID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (45) NOT NULL,
    PRIMARY KEY (mealID)
);
# Taulu raaka-aineita varten
CREATE TABLE IF NOT EXISTS ingredient (
	ingredientID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (45) NOT NULL,
    calories INT,
    PRIMARY KEY (ingredientID)
);
# Taulu aterian ainesosia varten
CREATE TABLE IF NOT EXISTS mealIngredient (
	mealIngredientID INT NOT NULL AUTO_INCREMENT,
	mealID INT,
    ingredientID INT,
    amount INT,
    PRIMARY KEY (mealIngredientID),
    CONSTRAINT fk_mealIngredient_meal
		FOREIGN KEY (mealID)
		REFERENCES meal(mealID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_mealIngredient_ingredient
		FOREIGN KEY (ingredientID)
		REFERENCES ingredient(ingredientID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
# Taulu ruokapäiväkirjan kirjauksia varten
CREATE TABLE IF NOT EXISTS entry (
	entryID INT NOT NULL AUTO_INCREMENT,
    personID INT,
    mealID INT,
    dateAndTime DATETIME NOT NULL,
    portions DECIMAL(3,2),
    PRIMARY KEY (entryID),
    CONSTRAINT fk_entry_person
		FOREIGN KEY (personID)
		REFERENCES person(personID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_entry_meal
		FOREIGN KEY (mealID)
		REFERENCES meal(mealID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);
# Testidata
INSERT INTO person VALUES
	(1, 'Maijukka', '1995-12-12', 167),
    (2, 'Hunaja1990', '1990-10-11', 184),
    (3, 'Helman', NULL, NULL);
INSERT INTO weightEntry VALUES
	(1, 60, '2023-04-12 10:16', 1),
    (2, 80, '2023-04-11 10:16', 1),
    (3, 90, '2023-04-04 10:16', 1);
INSERT INTO ingredient VALUES
	(1, "Porkkana", 110),
    (2, "Peruna", 200),
    (3, "Kana", 100);
INSERT INTO meal VALUES
	(1, "Aamiainen"),
    (2, "Toinen aamiainen");
INSERT INTO mealIngredient VALUES
	(1, 1, 2, 250),
	(2, 2, 1, 150),
    (3, 2, 3, 300);
INSERT INTO entry VALUES
	(1, 1, 2, "2023-04-15 12:00", 1),
    (2, 1, 1, "2023-04-16 9:00", 1);
