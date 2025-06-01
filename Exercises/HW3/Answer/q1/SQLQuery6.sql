SELECT column2, column4, column12, column7
FROM Movies
WHERE column11 like '%Al Pacino%'  and column11 in (
	select column11 
	from Movies
	where column11 like '%Robert De Niro%')