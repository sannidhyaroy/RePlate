CREATE TABLE IF NOT EXISTS recipes (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- name of the recipe
    description TEXT, -- brief description of the recipe
    ingredients TEXT NOT NULL, -- comma-separated list of ingredients
    ingredients_array TEXT[], -- array of ingredients
    ingredients_tsvector TSVECTOR, -- for full-text search
    instructions TEXT NOT NULL, -- step-by-step instructions
    preparation_time INT, -- in minutes
    cooking_time INT, -- in minutes
    total_time INT, -- in minutes
    servings INT, -- number of servings
    cuisine VARCHAR(100), -- e.g., Italian, Mexican, Indian, Chinese, Thai
    course VARCHAR(100), -- e.g., appetizer, main course, dessert
    diet VARCHAR(100), -- e.g., vegetarian, vegan, gluten-free
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, -- timestamp of creation
);
