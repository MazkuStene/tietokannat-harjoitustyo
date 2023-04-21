CREATE TABLE IF NOT EXISTS person (
	personID INT NOT NULL AUTO_INCREMENT,
    nickname VARCHAR (45) NOT NULL,
    birthday DATE,
    height INT,
    PRIMARY KEY (personID)
);
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
CREATE TABLE IF NOT EXISTS meal (
	mealID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (45) NOT NULL,
    portions DECIMAL(3,2),
    PRIMARY KEY (mealID)
);
CREATE TABLE IF NOT EXISTS ingredient (
	ingredientID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (45) NOT NULL,
    calories INT,
    weight INT,
    mealID INT,
    PRIMARY KEY (ingredientID)
);
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