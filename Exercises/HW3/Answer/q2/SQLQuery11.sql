SELECT top 10 Username, 
       SUM(QuoteCount + LikeCount + RetweetCount + ReplyCount) AS TotalEngagement
FROM chatgpt
GROUP BY Username
ORDER BY TotalEngagement DESC
