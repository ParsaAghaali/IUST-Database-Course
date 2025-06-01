SELECT 
    SUM(CASE WHEN Price_Category_Code <> 'Low Fare' THEN Passenger_Count ELSE 0 END) 
    - SUM(CASE WHEN Price_Category_Code = 'Low Fare' THEN Passenger_Count ELSE 0 END) 
    AS Difference
FROM Air_Traffic_Passenger_Statistics