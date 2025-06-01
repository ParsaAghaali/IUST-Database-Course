SELECT SUM(column4) / COUNT(*) AS AverageScore
FROM dbo.Movies
WHERE column11 like '%Leonardo DiCaprio%'