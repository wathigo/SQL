--1. List the teachers who have NULL for their department

SELECT name
FROM teacher
WHERE dept IS NULL

--2. INNER JOIN does not iclude teachers with no department and department with no teachers

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

--3. Unlike #2 all teachers will be included when LEFT JOIN is used

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

--4. all departments will be included when LEFT JOIN is used

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

--5. teacher name and mobile number or '07986 444 2266' using COALESCE(returns non-null values)

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher

--6. COALESCE function and a LEFT JOIN to print the teacher name and department name

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON (dept=dept.id)

--7. COUNT to show the number of teachers and the number of mobile phones

SELECT COUNT(name), COUNT(COALESCE(mobile))
FROM teacher

--8. COUNT and GROUP BY dept.name to show each department and the number of staff

SELECT dept.name, COUNT(teacher.name)
FROM dept LEFT JOIN teacher ON teacher.dept = dept.id
GROUP BY dept.name

--9. CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwis

SELECT name,
CASE WHEN teacher.dept IN (1, 2) THEN 'Sci'ELSE 'Art' END
FROM teacher

--10. CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise

SELECT name,
CASE WHEN dept IN (1, 2) THEN 'Sci'
WHEN dept = 3 THEN 'Art'
ELSE 'None' END
FROM teacher
