use call_center;
SELECT * from call_c2 LIMIT 10;
----- Data cleaning ----
set SQL_SAFE_UPDATES=0;
--change date format---
UPDATE call_c2 set call_timestamp = STR_TO_DATE(call_timestamp,"%m/%d/%Y");
--updating empty values to Null----
UPDATE call_c2 set csat_score=NULL where csat_score ='';

set sql_safe_updates =1;
SELECT * from call_c2 LIMIT 10;

--count of num or rows and num of columns in the table---
SELECT count(*) as num_rows from call_c2;
SELECT count(*) as num_columns from information_schema.COLUMNS where TABLE_NAME = 'call_c2' and `TABLE_SCHEMA`='call_center';

--to select didtinct values in ecah columns --
SELECT DISTINCT sentiment from call_c2;
SELECT DISTINCT city from call_c2;
SELECT DISTINCT call_center from call_c2;

--count and % from total of each distinct values in a columns in call_c2 table---
SELECT city ,count(*) as Count1,COUNT(*) *100.0/(SELECT count(*) from call_c2) as percentage from call_c2 GROUP BY city;

---call count of each day---
SELECT DAYNAME(call_timestamp) as day_of_week, count(*) as count_calls from call_c2 GROUP BY day_of_week ORDER BY count_calls DESC;

---calculations---
SELECT min('call_duration_in_minutes') as min_duration,
max('call_duration_in_minutes') as max_duration,
avg('call_duration_in_minutes') as avg_duration
from call_c2;

SELECT min(csat_score) as min_csat,
max(csat_score) as max_csat,
round(avg(csat_score),2) as avg_csat
from call_c2
WHERE csat_score <> 0;--where cast_score is not equaks to 0---

select call_center ,response_time, count(*) as count1 from call_center.call_c2 GROUP BY 1,2 ORDER BY 1,3 DESC;

SELECT DATE(call_timestamp) as call_day,
max('call_duration_in_minutes') as max_call_duration
from call_c2 GROUP BY call_day ORDER BY call_day;