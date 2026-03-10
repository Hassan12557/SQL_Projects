 -- Movies vs TV Shows
SELECT type, COUNT(*) total_titles
FROM netflix_titles
GROUP BY type;
-- Top 10 Countries Producing Content
SELECT country, COUNT(*) total_titles
FROM netflix_titles
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

 -- Content Added Per Year
 SELECT YEAR(STR_TO_DATE(date_added,'%M %d, %Y')) AS year_added,
COUNT(*) total_titles
FROM netflix_titles
GROUP BY year_added
ORDER BY year_added;
-- Genre Analysis
SELECT listed_in, COUNT(*) total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;

-- Rating Distribution
SELECT rating, COUNT(*) total_titles
FROM netflix_titles
GROUP BY rating
ORDER BY total_titles DESC;

-- Movies Duration Analysis
SELECT duration, COUNT(*) total
FROM netflix_titles
WHERE type='Movie'
GROUP BY duration
ORDER BY total DESC
LIMIT 10;
-- Directors with Most Titles
SELECT director, COUNT(*) total_titles
FROM netflix_titles
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- Content Released vs Added to Netflix
SELECT title, release_year,
YEAR(STR_TO_DATE(date_added,'%M %d, %Y')) AS added_year
FROM netflix_titles
WHERE YEAR(STR_TO_DATE(date_added,'%M %d, %Y')) - release_year > 10
LIMIT 20;

-- Movies vs TV Shows Trend
SELECT
release_year,
SUM(CASE WHEN type='Movie' THEN 1 ELSE 0 END) movies,
SUM(CASE WHEN type='TV Show' THEN 1 ELSE 0 END) tv_shows
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year;