--1. Total population of the world

SELECT SUM(population)
FROM world

--2.  List of all continents without dublicates

SELECT DISTINCT continent
FROM world

--3. Sum of all gdp in Africa

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

--4. number of countries have an area of at least 1000000

SELECT COUNT(name)
FROM world
WHERE area >= 1000000

--5. sum of population of Estonia, Latvia, and Lithuania

SELECT SUM(population) FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

--6. no. of countries withing a continent

SELECT continent, COUNT(name)
FROM world as x
GROUP BY continent

--7. no. of countries with a population of atleast 10 million withing a continent

SELECT continent, COUNT(name)
FROM world as x
WHERE population >= 10000000
GROUP BY continent

--8. continents that have a total population of at least 100 million

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000
