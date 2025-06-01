select hashtag , count(*) as c
FROM chatgpt
where hashtag is not NULL
group by hashtag
order by c DESC