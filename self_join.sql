--1.  number of stops in the database

SELECT COUNT(id)
FROM stops

--2. id value for the stop 'Craiglockhart'

SELECT id
  FROM stops
 WHERE name = 'Craiglockhart'


 --3. the id and the name for the stops on the '4' 'LRT' service

 SELECT id, name
  FROM stops JOIN route ON (id = stop)
 WHERE num = '4' AND company = 'LRT'

--4. the number of routes that visit either London Road (149) or Craiglockhart (53). HAVING is used to restrict output to these two routes

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1

--5. services from Craiglockhart to London Road

SELECT x.company, x.num, x.stop, y.stop
 FROM route x JOIN route y ON
      (x.company = y.company AND x.num =y.num)
WHERE x.stop = 53 AND y.stop = 149

--6. services  between 'Craiglockhart' and 'London Road'

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND
stopb.name='London Road'

--7. list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith'

SELECT x.company, x.num
FROM route x JOIN route y ON
  (x.company=y.company AND x.num=y.num)
  JOIN stops stopx ON (x.stop=stopx.id)
  JOIN stops stopy ON (y.stop=stopy.id)
WHERE stopx.name='Haymarket' AND stopy.name='Leith'
GROUP BY x.company, x.num

--8. list of the services which connect the stops 'Craiglockhart' and 'Tollcross

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

--9. distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company

SELECT DISTINCT stopb.name, a.company, a.num FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  WHERE stopa.name='Craiglockhart'
