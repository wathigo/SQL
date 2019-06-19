--1. country name where the population is larger than that of 'Russia

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--2. countries in Europe with a per capita GDP greater than 'United Kingdom

SELECT name
FROM world
WHERE continent = 'Europe' AND
gdp/population >(SELECT gdp/population
                 FROM world
                 WHERE name = 'United Kingdom')

--3. name and continent of countries in the continents containing either
--Argentina or Australia ordered by name of the country

SELECT name, continent
FROM world
WHERE continent = (SELECT continent
                   FROM world
                   WHERE name = ('Argentina')) OR
      continent = (SELECT continent
                   FROM world
                   WHERE name = ('Australia'))
ORDER BY name

--4. country with a population that is more than Canada but less than Poland

SELECT name, population
FROM world
WHERE population > (SELECT population
                    FROM world
                    WHERE name = 'Canada') AND
      population < (SELECT population
                    FROM world
                    WHERE name = 'Poland')

--5. name and the population of each country in Europe.
--the population as a percentage of the population of Germany

SELECT name, concat(ROUND((population/1000000) * (SELECT 100/(population/1000000) FROM world WHERE name = 'Germany') ), '%')
FROM world
WHERE continent = 'Europe'

--6. countries have a GDP greater than every country in Europe

SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND  gdp > 0)

--7. largest country (by area) in each continent

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

--8. continent and the name of the country that comes first alphabetically

SELECT continent, name FROM world AS x
WHERE name <= ALL
(SELECT name FROM world AS y
WHERE y.continent = x.continent)

--9. continents where all countries have a population <= 25000000

SELECT name, continent, population
FROM world AS x
WHERE 25000000 >= ALL(SELECT population FROM world AS y
WHERE x.continent = y.continent AND population > 0)

--10. countires with populations more than three times that of any of their neighbours

SELECT name, continent
FROM world AS x
WHERE population > ALL(SELECT population*3 FROM world AS y
WHERE y.name != x.name AND y.continent = x.continent )
