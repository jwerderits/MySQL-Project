-- SELECT 
--     DATE_FORMAT(created_at, '%W') as day_week,
--     count(*) as 'count'
-- FROM users
-- GROUP BY day_week
-- ORDER BY count DESC;

-- SELECT 
--     username,
--     count(photos.user_id) as total_pics
-- FROM users
-- LEFT JOIN photos
--     ON photos.user_id = users.id
-- GROUP BY username
-- HAVING total_pics = 0;

-- SELECT
--     users.username as 'username',
--     likes.photo_id,
--     count(*) as num_likes
-- FROM photos
-- INNER JOIN likes
--     ON likes.photo_id = photos.id
-- INNER JOIN users
--     ON users.id = photos.user_id
-- GROUP BY photos.id
-- ORDER BY num_likes DESC
-- LIMIT 1;

-- SELECT
--     tag_name,
--     count(*) as total
-- FROM photo_tags
-- JOIN tags
--     ON photo_tags.tag_id = tags.id
-- GROUP BY tags.id
-- ORDER BY total DESC
-- LIMIT 5;

SELECT
    users.username,
    count(*) / (SELECT count(*) FROM photos) as total
FROM users
JOIN likes
    ON users.id = likes.user_id
GROUP BY users.id
HAVING total >=1
ORDER BY total DESC;











