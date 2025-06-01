SELECT column2, column9
FROM Movies
WHERE column2 NOT IN (
    SELECT TOP 50 column2
    FROM Movies
    ORDER BY column10 DESC
)
ORDER BY column9 DESC