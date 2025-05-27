-- Populate the ingredients_array column by splitting the ingredients string
UPDATE recipes SET ingredients_array = (
  SELECT array_agg(trim(both from ing))
  FROM unnest(string_to_array(ingredients, ',')) AS ing
);

-- Create a full-text search index on the ingredients_tsvector column
UPDATE recipes SET ingredients_tsvector = to_tsvector('english', array_to_string(
  ARRAY(
    SELECT trim(both from regexp_replace(ing, '\s*(–|-).*$', '', 'g'))
    FROM unnest(ingredients_array) AS ing
  ), ' '
));
