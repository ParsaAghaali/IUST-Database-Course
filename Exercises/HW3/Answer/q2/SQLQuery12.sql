SELECT Username, COUNT(DISTINCT Language) AS NumLanguages
FROM chatgpt
GROUP BY Username
HAVING COUNT(DISTINCT Language) > 1
ORDER BY NumLanguages DESC