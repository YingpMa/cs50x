SELECT movies.title
FROM movies
INNER JOIN stars AS s1
ON s1.movie_id = movies.id
INNER JOIN people AS p1
ON s1.person_id = p1.id
INNER JOIN stars AS s2
ON s2.movie_id = movies.id
INNER JOIN people AS p2
ON s2.person_id = p2.id
WHERE p1.name ='Bradley Cooper' AND p2.name = 'Jennifer Lawrence';
