CREATE VIEW content_type_distribution AS
SELECT type, COUNT(*) total_titles
FROM netflix_titles
GROUP BY type;