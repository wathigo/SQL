--1. matchid and player name for teamid starting with 'GER'

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000

--2. id, stadium, team1, and team2 for game id = 1012

SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012

--3. the player, teamid, stadium and mdate for every German goal

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid LIKE 'GER'

--4 team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%

SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'

--5. player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, coach, gtime
  FROM goal join eteam ON (teamid=id)
 WHERE gtime<=10

--6. dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach

SELECT mdate, teamname
  FROM game join eteam ON (team1=eteam.id)
 WHERE coach LIKE 'Fernando Santos'

-- 7. player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT player
  FROM game join goal ON (matchid=id)
 WHERE stadium LIKE 'National Stadium, Warsaw'

--8. the name of all players who scored a goal against Germany

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
    WHERE teamid != 'GER' AND
          (team1='GER' OR team2 ='GER')

--9. teamname and the total number of goals scored

SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;


--10. the stadium and the number of goals scored in each stadium

SELECT stadium, COUNT(player)
  FROM game JOIN goal ON matchid=id
GROUP BY stadium

--11. the matchid, date and the number of goals scored for every match involving 'POL'

SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

--12 matchid, match date and the number of goals scored by 'GER for every match where 'GER' scored

SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid, mdate

--13. match with the goals scored by each team

SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, team1, team2;
