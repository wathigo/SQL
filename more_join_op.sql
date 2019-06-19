--1. films where the yr is 1962

SELECT id, title
 FROM movie
 WHERE yr=1962


--2. year of 'Citizen Kane' release

SELECT yr
 FROM movie
 WHERE title='Citizen Kane'

--3. List all of the Star Trek movies

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

--4. id number of the actor 'Glenn Close'

SELECT id
FROM actor
WHERE name LIKE 'Glenn Close'

--5. id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title = 'Casablanca'

--6. cast list for 'Casablanca'

SELECT name
FROM actor JOIN casting ON actor.id=actorid
WHERE movieid = 11768

--7. cast list for the film 'Alien'

SELECT name
FROM actor JOIN casting ON actor.id=actorid
WHERE movieid = (SELECT id
                 FROM movie
                 WHERE title = 'Alien')

--8. films in which 'Harrison Ford' has appeared

SELECT title
FROM movie JOIN casting ON id=movieid
WHERE actorid = (SELECT id
                 FROM actor
                 WHERE name LIKE 'Harrison Ford')

--9. films where 'Harrison Ford' has appeared - but not in the starring role

SELECT title
FROM movie JOIN casting ON id=movieid
WHERE actorid = (SELECT id
                 FROM actor
                 WHERE name = 'Harrison Ford') AND
                 ord != 1;

--10. List of the films together with the leading star for all 1962 films

SELECT title, name
FROM movie JOIN casting ON (movie.id=movieid) JOIN
actor ON (actorid=actor.id)
WHERE ord=1 AND
yr = 1962

--11. busiest years for 'John Travolta'. ie. made more than 2 movies

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

--12.  list, in alphabetical order, of actors who've had at least 30 starring roles

SELECT actor.name
FROM actor JOIN casting ON (id=actorid)
WHERE ord=1
GROUP BY name
HAVING COUNT(name) > 29
ORDER BY name ASC;

--13. film title and the leading actor for all of the films 'Julie Andrews' played in

SELECT title, name
FROM movie JOIN casting ON (movie.id=movieid)
JOIN actor ON (actorid=actor.id)
WHERE ord = 1 AND
movieid = ANY(
             SELECT movieid FROM casting
             WHERE actorid IN(
                              SELECT actor.id FROM actor
                              WHERE name='Julie Andrews'))


--14. films released in the year 1978 ordered by the number of actors in the cast, then by title

SELECT title, COUNT(movieid)
FROM movie
JOIN casting ON (movie.id=casting.movieid) JOIN
actor ON (actorid=actor.id)
WHERE yr=1978
GROUP BY movie.title
ORDER BY COUNT(movieid) DESC, title

--15. all the people who have worked with 'Art Garfunkel'

SELECT name FROM actor
JOIN casting ON (actor.id=actorid)
JOIN movie ON (movie.id=movieid)
WHERE actor.name!='Art Garfunkel' AND
casting.movieid=ANY(
                    SELECT casting.movieid
                    FROM casting
                    WHERE casting.actorid=
                    (SELECT actor.id
                     FROM actor
                     WHERE ctor.name='Art Garfunkel'))
GROUP BY actor.name;
