### Task 1
##### Display the names of the unique launch sites  in the space mission
%sql select Unique(LAUNCH_SITE) from SPACEXTBL;

### Task 2
##### Display 5 records where launch sites begin with the string 'CCA'
%sql SELECT Date, time, Booster_Version, LAUNCH_SITE from SPACEXTBL where LAUNCH_SITE LIKE ('CCA%') LIMIT 5;

### Task 3
##### Display the total payload mass carried by boosters launched by NASA (CRS)
%sql select sum(PAYLOAD_MASS__KG_) as payloadmasskg from SPACEXTBL where Customer = ‘NASA (CRS)’;

### Task 4
##### Display average payload mass carried by booster version F9 v1.1
%sql select avg(PAYLOAD_MASS__KG_) as payloadmasskg from SPACEXTBL where booster_version = 'F9 v1.1';

### Task 5
##### List the date when the first successful landing outcome in ground pad was acheived.

*Hint:Use min function*
sql select min(DATE) as mindate from SPACEXTBL where landing_outcome like '%ground pad%';

### Task 6
##### List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000
%sql select BOOSTER_VERSION from SPACEXTBL where LANDING__OUTCOME='Success (drone ship)' and PAYLOAD_MASS__KG BETWEEN 4001 and 5999;

### Task 7
##### List the total number of successful and failure mission outcomes
%sql select MISSION_OUTCOME , count(*) as missionoutcomes from SPACEXTBL GROUP BY MISSION_OUTCOME

### Task 8
##### List the names of the booster_versions which have carried the maximum payload mass. Use a subquery
%sql select BOOSTER_VERSION  from SPACEXTBL where PAYLOAD_MASS__KG_=(select max(PAYLOAD_MASS__KG_) from SPACEXTBL);

### Task 9
##### List the failed landing_outcomes in drone ship, their booster versions, and launch site names for in year 2015
%sql SELECT MISSION_OUTCOME,BOOSTER_VERSION,LAUNCH_SITE FROM SPACEXTBL where EXTRACT(YEAR FROM DATE)='2015' and landing_outcome like '%Failure%';

### Task 10
##### Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) between the date 2010-06-04 and 2017-03-20, in descending order
%sql SELECT LANDING_OUTCOME from SPACEXTBL WHERE DATE BETWEEN '2010-06-04' AND '2017-03-20' ORDER BY DATE DESC;