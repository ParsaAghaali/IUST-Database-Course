
SELECT column2, column4, column12
FROM Movies
WHERE column2 IN(
    SELECT TOP 10 column2
    FROM Movies
	WHERE column3 BETWEEN 1990 AND 1999
    ORDER BY column10 DESC
)