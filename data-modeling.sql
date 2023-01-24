CREATE TABLE useracc (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE Recipe (
    user_id INTEGER NOT NULL REFERENCES useracc(user_id),
    recipe_id SERIAL PRIMARY KEY,
    ingredients VARCHAR(255),
    instructions VARCHAR(255),
    public_access BOOLEAN
);

CREATE TABLE Occasion (
    user_id INTEGER NOT NULL REFERENCES useracc(user_id),
    occasion_id SERIAL PRIMARY KEY,
    occasion VARCHAR(255)
);

CREATE TABLE RecipeOccasion (
    recipe_id INTEGER NOT NULL REFERENCES Recipe(recipe_id),
    occasion_id INTEGER NOT NULL REFERENCES Occasion(occasion_id)
);

CREATE TABLE Grocery (
    user_id INTEGER NOT NULL REFERENCES useracc(user_id),
    grocery_id INTEGER NOT NULL REFERENCES Recipe(recipe_id)
);

INSERT INTO useracc (email, password)
VALUES ('jasmine123@gmail.com', 'fjdklwuifjwea'),
('emily123@gmail.com', 'helloworld'),
('drcchg@yahoo.com', 'ilove2cycle');

INSERT INTO Recipe (user_id, ingredients, instructions, public_access)
VALUES (1, 'potatoes', 'boil them', TRUE),
(2, 'strawberries', 'pick them', FALSE),
(3, 'chocolate', 'melt them', TRUE)
(1, 'candies', 'eat them', TRUE);

INSERT INTO Occasion (user_id, occasion)
VALUES (1, 'christmas'),
(1, 'easter'),
(2, 'birthday'),
(2, 'christmas'),
(3, 'chinese new year'),
(3, 'birthday');

INSERT INTO RecipeOccasion (recipe_id, occasion_id)
VALUES (1, 2),
(1, 4),
(2, 2),
(3, 1),
(4, 3),
(3, 5),
(4, 6);

INSERT INTO Grocery (user_id, grocery_id)
VALUES (1, 2),
(1, 4),
(2, 1),
(2, 3),
(3, 1);