 -- Top most common rating per year
SELECT *
FROM (
SELECT
release_year,
rating,
COUNT(*) total,
RANK() OVER(PARTITION BY release_year ORDER BY COUNT(*) DESC) rnk
FROM netflix_titles
GROUP BY release_year, rating
) ranked
WHERE rnk = 1;
CREATE VIEW top_countries AS
SELECT country, COUNT(*) total_titles
FROM netflix_titles
GROUP BY country
ORDER BY total_titles DESC;

