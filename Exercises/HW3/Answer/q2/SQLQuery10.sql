SELECT Language, COUNT(*) AS TweetCount
FROM chatgpt
GROUP BY Language
ORDER BY TweetCount DESC