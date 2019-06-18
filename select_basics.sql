-- 1. Query to return population of Germany

SELECT population FROM world
  WHERE name = 'Germany'

--2. Query to return the population for Sweden, Norway, and Denmark

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

--3. Query to return the country and areas where area values is in the 200000 - 250000

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
