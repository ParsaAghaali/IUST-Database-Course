SELECT *
FROM Air_Traffic_Passenger_Statistics
WHERE Passenger_Count < (SELECT AVG(Passenger_Count) FROM Air_Traffic_Passenger_Statistics)