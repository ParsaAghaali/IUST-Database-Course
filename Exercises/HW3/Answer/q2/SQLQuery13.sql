SELECT 
    CASE 
        WHEN Source LIKE '%Web%' THEN 'Twitter Web App'
        WHEN Source LIKE '%iPhone%' THEN 'Twitter for iPhone'
		WHEN Source LIKE '%Android%' THEN 'Twitter for Android'
        ELSE Source
    END AS SourceGroup,
    COUNT(*) AS TweetCount
FROM chatgpt
GROUP BY 
    CASE 
        WHEN Source LIKE '%Web%' THEN 'Twitter Web App'
        WHEN Source LIKE '%iPhone%' THEN 'Twitter for iPhone'
		WHEN Source LIKE '%Android%' THEN 'Twitter for Android'
        ELSE Source
    END
ORDER BY TweetCount DESC