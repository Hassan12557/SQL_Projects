SELECT
COUNT(*) total_rows,
COUNT(director) directors_present,
COUNT(country) country_present,
COUNT(cast) cast_present
FROM netflix_titles;
UPDATE netflix_titles
SET director = 'Unknown'
WHERE director IS NULL;

-- Disable safe update mode for your current session
SET SQL_SAFE_UPDATES = 0;

-- Now run your update
UPDATE netflix_titles 
SET country = 'Unknown' 
WHERE country IS NULL;

UPDATE netflix_titles 
SET director = 'Unknown' 
WHERE director IS NULL;

-- Re-enable safe update mode (optional but recommended)
SET SQL_SAFE_UPDATES = 1;