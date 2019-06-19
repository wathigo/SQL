--1. percentage who STRONGLY AGREE

SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

--2. the institution and subject where the score is at least 100 for question 15

SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >= 100

--3. institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'

SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
   AND score < 50

--4. subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design

SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   OR subject='(8) Computer Science')
GROUP BY subject

--5. subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'

SELECT subject, SUM((response * A_STRONGLY_AGREE)/100)
  FROM nss
 WHERE question='Q22'
   AND (subject='(H) Creative Arts and Design'
   OR subject='(8) Computer Science')
GROUP BY subject

--6. percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science'

SELECT subject, ROUND(SUM(A_STRONGLY_AGREE * response) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND subject='(H) Creative Arts and Design'
     OR subject='(8) Computer Science' GROUP BY subject

--7. average scores for question 'Q22' for each institution that include 'Manchester' in the name

SELECT institution,
ROUND(SUM(response * score)/SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution

--8. institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'
SELECT institution, SUM(sample),
SUM(CASE WHEN subject = '(8) Computer Science'
THEN sample END)
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
  GROUP BY institution
