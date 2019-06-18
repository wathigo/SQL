--1. Nobel prizes for 1950

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

 --2. 1962 prize for Literature winner

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

--3. the year and subject 'Albert Einstein' won his prize

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

--4. name of the 'Peace' winners since the year 2000, including 2000

SELECT winner
FROM nobel
WHERE yr >= 2000
AND subject = 'Peace'

--5. details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature'
AND yr >= 1980
AND yr <= 1989

--6. all details of the presidential winners

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

--7. winners with first name John

SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

--8 year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Physics' AND yr = 1980
 OR
subject = 'Chemistry' AND yr = 1984

--9. year, subject, and name of winners for 1980 excluding Chemistry and Medicine

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND
subject NOT IN ('Chemistry', 'Medicine')

--10. ar, subject, and name of people who won a 'Medicine' prize in an early
-- year (before 1910, not including 1910) together with winners of a
-- 'Literature' prize in a later year (after 2004, including 2004)

SELECT * FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR
(subject = 'Literature' AND
yr >= 2004)

--11. all details of the prize won by PETER GRÜNBERG

SELECT * FROM nobel
WHERE winner = 'Peter Grünberg'

--12. all details of the prize won by Eugene O''Neill

SELECT *
FROM nobel
WHERE winner LIKE 'Eugene O''Neill'

--13. the winners, year and subject where the winner starts with Sir

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC

--14. the 1984 winners and subject ordered by subject and winner name; but Chemistry and Physics come last


SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner
