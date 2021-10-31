--In 1.sql, write a SQL query to list the titles of all movies released in 2008.

SELECT title FROM movies WHERE year = 2008;

--In 2.sql, write a SQL query to determine the birth year of Emma Stone.

SELECT birth FROM people WHERE name = "Emma Stone";

--In 2.sql, write a SQL query to determine the birth year of Emma Stone.

SELECT birth FROM people WHERE name = "Emma Stone";

--In 4.sql, write a SQL query to determine the number of movies with an IMDb rating of 10.0.

--Executing 4.sql results in a table with 1 column and 1 row.

SELECT COUNT(rating) FROM ratings WHERE rating = 10.0;

--In 5.sql, write amSQL query to list the titles and release years of all Harry Potter movies, in chronological order.
--Your query should output a table with two columns, one for the title of each movie and one for the release year of each movie.
--You may assume that the title of all Harry Potter movies will begin with the words “Harry Potter”, and that if a movie title begins with the words “Harry Potter”, it is a Harry Potter movie.

--Executing 5.sql results in a table with 2 columns and 10 rows.

SELECT title, year FROM movies WHERE title LIKE "Harry Potter%" ORDER BY year;


--In 6.sql, write a SQL query to determine the average rating of all movies released in 2012.
--Your query should output a table with a single column and a single row (not including the header) containing the average rating.

--Executing 6.sql results in a table with 1 column and 1 row


SELECT AVG(rating) FROM ratings
JOIN movies
ON ratings.movie_id = movies.id
WHERE movies.year = 2012;

