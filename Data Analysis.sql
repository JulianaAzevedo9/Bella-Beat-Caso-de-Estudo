--Time spent on activity per day
SELECT DISTINCT 
    Id, 
    SUM(sedentaryminutes) AS sedentaryminutes,
    SUM(lightlyactiveminutes) AS lightly_active_mins,
    SUM(fairlyactiveminutes) AS fairly_active_mins, 
    SUM(veryactiveminutes) AS very_active_mins
FROM dailyactivity
WHERE total_time_in_bed IS NOT NULL
GROUP BY Id;

--Daily Average analysis
SELECT 
    AVG(totalsteps) AS avg_steps,
    AVG(totaldistance) AS avg_distance,
    AVG(calories) AS avg_calories,
    day_of_week
FROM dailyactivity
GROUP BY day_of_week
ORDER BY day_of_week;

--Daily Sum Analysis - No trends/patterns found
SELECT 
    SUM(totalsteps) AS total_steps,
    SUM(totaldistance) AS total_distance,
    SUM(calories) AS total_calories,
    day_of_week
FROM dailyactivity
GROUP BY day_of_week
ORDER BY day_of_week;

--Activities and calories comparison
SELECT 
    Id,
    SUM(totalsteps) AS total_steps,
    SUM(veryactiveminutes) AS total_very_active_mins,
    SUM(fairlyactiveminutes) AS total_fairly_active_mins,
    SUM(lightlyactiveminutes) AS total_lightly_active_mins,
    SUM(calories) AS total_calories
FROM dailyactivity
GROUP BY Id
ORDER BY Id;  

--Average Sleep Time per user
SELECT 
    Id, 
    AVG(total_minutes_asleep) / 60 AS avg_sleep_time_hour,  -- Average sleep time in hours
    AVG(total_time_in_bed) / 60 AS avg_time_bed_hour,        -- Average time in bed in hours
    AVG(total_time_in_bed - total_minutes_asleep) AS wasted_bed_time_min  -- Average wasted time in bed in minutes
FROM 
    sleep_data
GROUP BY 
    Id
ORDER BY 
    Id;  

--Sleep and calories comparison 
SELECT 
    temp1.Id, 
    SUM(temp2.total_minutes_asleep) AS total_sleep_min,      -- Total sleep time in minutes
    SUM(temp2.total_time_in_bed) AS total_time_in_bed_min,   -- Total time in bed in minutes
    SUM(temp1.calories) AS total_calories                   -- Total calories consumed
FROM 
    dailyactivity AS temp1
INNER JOIN 
    sleep_data AS temp2
ON 
    temp1.Id = temp2.Id AND temp1.activitydate = temp2.sleep_date
GROUP BY 
    temp1.Id
ORDER BY 
    temp1.Id;  

--average met per day per user, and compare with the calories burned
SELECT 
    temp1.Id, 
    temp1.date, 
    SUM(temp1.mets) AS sum_mets,               -- Total METs per day
    SUM(temp2.calories) AS total_calories      -- Total calories burned per day
FROM 
    minutes_met_narrow AS temp1
INNER JOIN 
    dailyactivity AS temp2
ON 
    temp1.id = temp2.id AND temp1.date = temp2.date
GROUP BY 
    temp1.Id, 
    temp1.date
ORDER BY 
    temp1.date
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;           -- Pagination

