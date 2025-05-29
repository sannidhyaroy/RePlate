-- RPC: Get a recipe by its id
CREATE OR REPLACE FUNCTION get_recipe_by_id(recipe_id integer)
RETURNS TABLE (
    id integer,
    name varchar(255),
    description text,
    ingredients_array text[],
    instructions text,
    preparation_time int,
    cooking_time int,
    total_time int,
    servings int,
    cuisine varchar(100),
    course varchar(100),
    diet varchar(100),
    created_at timestamp
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        recipes.id, recipes.name, recipes.description, recipes.ingredients_array, 
        recipes.instructions, recipes.preparation_time, recipes.cooking_time, 
        recipes.total_time, recipes.servings, recipes.cuisine, recipes.course, 
        recipes.diet, recipes.created_at
    FROM recipes
    WHERE recipes.id = recipe_id;
END;
$$ LANGUAGE plpgsql STABLE;

-- RPC: Exact match search for recipes with all specified ingredients
CREATE OR REPLACE FUNCTION search_recipes_exact(input_ingredients text[])
RETURNS TABLE (
    id integer,
    name varchar(255),
    ingredients_array text[],
    preparation_time int,
    cooking_time int,
    total_time int,
    relevance_score real
) AS $$
DECLARE
    query_str text;
BEGIN
    -- Join ingredients with ' & ' for exact match
    query_str := array_to_string(input_ingredients, ' & ');
    RETURN QUERY
    SELECT recipes.id, recipes.name, recipes.ingredients_array, recipes.preparation_time, recipes.cooking_time, recipes.total_time, ts_rank(ingredients_tsvector, to_tsquery('english', query_str))
    FROM recipes
    WHERE ingredients_tsvector @@ to_tsquery('english', query_str)
    ORDER BY ts_rank(ingredients_tsvector, to_tsquery('english', query_str)) DESC;
END;
$$ LANGUAGE plpgsql STABLE;

-- RPC: Fuzzy match search for recipes with any of the specified ingredients
CREATE OR REPLACE FUNCTION search_recipes(input_ingredients text[])
RETURNS TABLE (
    id integer,
    name varchar(255),
    ingredients_array text[],
    preparation_time int,
    cooking_time int,
    total_time int,
    relevance_score real
) AS $$
DECLARE
    query_str text;
BEGIN
    -- Join ingredients with ' | ' for fuzzy match
    query_str := array_to_string(input_ingredients, ' | ');
    RETURN QUERY
    SELECT recipes.id, recipes.name, recipes.ingredients_array, recipes.preparation_time, recipes.cooking_time, recipes.total_time, ts_rank(ingredients_tsvector, to_tsquery('english', query_str))
    FROM recipes
    WHERE ingredients_tsvector @@ to_tsquery('english', query_str)
    ORDER BY ts_rank(ingredients_tsvector, to_tsquery('english', query_str)) DESC;
END;
$$ LANGUAGE plpgsql STABLE;

-- RPC: Fuzzy Search for recipes with minimum extra ingredients
CREATE OR REPLACE FUNCTION search_recipes_optimal(input_ingredients text[])
RETURNS TABLE (
    id integer,
    name varchar(255),
    ingredients_array text[],
    total_ingredients int,
    matching_ingredients int,
    extra_ingredients int,
    relevance_score real
) AS $$
DECLARE
    query_str text;
BEGIN
    -- Join ingredients with ' | ' for fuzzy match
    query_str := array_to_string(input_ingredients, ' | ');
    RETURN QUERY
    WITH intersections AS (
      SELECT
        r.id,
        r.name,
        r.ingredients_array,
        r.ingredients_tsvector,
        to_tsquery('english', query_str) AS user_query,
        ARRAY(
          SELECT i FROM unnest(r.ingredients_array) AS i
          WHERE EXISTS (
            SELECT 1 FROM unnest(input_ingredients) AS l
            WHERE i ILIKE '%' || replace(l, '+', ' ') || '%'
          )
        ) AS matched_ingredients
      FROM recipes r
    )
    SELECT
      i.id,
      i.name,
      i.ingredients_array,
      cardinality(i.ingredients_array) AS total_ingredients,
      cardinality(i.matched_ingredients) AS matching_ingredients,
      cardinality(i.ingredients_array) - cardinality(i.matched_ingredients) AS extra_ingredients,
      ts_rank(i.ingredients_tsvector, to_tsquery('english', query_str)) AS relevance_score
    FROM intersections i
    WHERE i.ingredients_tsvector @@ to_tsquery('english', query_str)
    ORDER BY extra_ingredients ASC, relevance_score DESC;
END;
$$ LANGUAGE plpgsql STABLE;
