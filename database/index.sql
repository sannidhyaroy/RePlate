-- Create a GIN index for full-text search on the ingredients_tsvector column
CREATE INDEX idx_keywords_fts ON recipes USING GIN (ingredients_tsvector);
