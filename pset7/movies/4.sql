SELECT SUM(CASE WHEN rating = 10.0 THEN 1 ELSE 0 END) AS movies_rating_10 FROM ratings;
