SELECT column1,column2, column12
FROM Movies
WHERE column5 like '%Crime%' AND column3 >= 1995 AND column3 <=2005 

intersect

SELECT column1,column2, column12
FROM Movies
WHERE column5 like '%Drama%' AND column3 >= 2000 AND column3 <=2010