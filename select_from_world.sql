--1. select from world

SELECT name, continent, population FROM world

--2. Using where clause

SELECT name FROM world
WHERE population >= 200000000

--3. name and the per capita GDP for those countries with a population of at least 200 million

SELECT name, GDP/population
FROM world
WHERE population >= 200000000

--4. name and population in millions for the countries of the continent 'South America'

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

--5. name and population for France, Germany, Italy

SELECT name, population
FROM world
WHERE name = 'France' OR name = 'Germany'
OR name = 'Italy'

--6. countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE '%united%'

--7. countries that are big by area or big by population

SELECT name, population, area
FROM world
WHERE area > 3000000 OR
population > 250000000

--8. countries that are big by area or big by population but not both

SELECT name, population, area
FROM world
WHERE area > 3000000 OR
population > 250000000

--9. name and population in millions and the GDP in billions for the countries of the continent 'South America'

SELECT name, ROUND(population/1000000, 2),
ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'

--10. name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros)

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000

--11. name and capital where the name and the capital have the same number of characters

SELECT name, capital
FROM world
 WHERE LENGTH(name) = LENGTH(capital)

--12. name and the capital where the first letters of each match

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND
name <> capital

--13. country that has all the vowels and no spaces in its name

SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'
