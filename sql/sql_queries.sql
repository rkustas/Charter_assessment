use covid;
show tables;

SELECT * FROM COVID;

-- SUM BY DATE WORLDWIDE
SELECT UPDATED, SUM(CONFIRMEDCHANGE) OVER( PARTITION BY UPDATED ORDER BY UPDATED ASC) AS CONFPERDAY
FROM COVID
WHERE COUNTRY_REGION = 'WORLDWIDE'
GROUP BY UPDATED;
 

-- 2 WEEK MOVING AVERAGE WORLDWIDE
SELECT WEEK(UPDATED), SUM(CONFIRMEDCHANGE) OVER( PARTITION BY WEEK(UPDATED) ORDER BY WEEK(UPDATED) RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS CONFPERDAY
FROM COVID
WHERE COUNTRY_REGION = 'WORLDWIDE'
GROUP BY WEEK(UPDATED);

-- RANKING EACH COUNTRY BY TOTAL SUM OF CONFIRMED
SELECT COUNTRY_REGION, SUM(CONFIRMEDCHANGE) AS CPR, RANK() OVER(ORDER BY SUM(CONFIRMEDCHANGE) DESC)
FROM COVID
WHERE COUNTRY_REGION <> 'WORLDWIDE' AND COUNTRY_REGION <> 'United States' AND ADMINREGION1 <> 'Not available'
GROUP BY COUNTRY_REGION;

-- DIFFERENCE FROM EACH DAY
SELECT UPDATED,CONFIRMED,DEATHS,RECOVERED,
	LAG(CONFIRMED) OVER W AS 'LAG',
    CONFIRMED - LAG(CONFIRMED) OVER W AS 'CONFCHANGE'
    FROM covid
    WINDOW W AS (ORDER BY UPDATED);
    

-- RANKING BY ADMINREGION2 IN THE UNITED STATES
SELECT ADMINREGION2, SUM(CONFIRMEDCHANGE) AS CPR, RANK() OVER(ORDER BY SUM(CONFIRMEDCHANGE) DESC)
FROM COVID
WHERE COUNTRY_REGION = 'United States' AND ADMINREGION1 <> 'Not available' AND ADMINREGION2 <>'Not available'
GROUP BY ADMINREGION2;


