-- Data exploration for daily activity

-- Checked all colummns in dailyactivity:
SELECT * FROM dailyactivity;

--Checking Number of Rows in dailyactivity:
SELECT  count(*) FROM dailyactivity;
-- There is 940 rows

-- Check data types in dailyactivity:
SELECT 
    column_name, 
    data_type,
    character_maximum_length,
    is_nullable
FROM 
    information_schema.columns
WHERE 
    table_name = 'dailyactivity'
ORDER BY 
    ordinal_position;

-- Check for duplicates in dailyactivity:
SELECT id, activitydate, totalsteps, Count(*)
FROM daily_activity
GROUP BY id, activitydate, totalsteps
HAVING Count(*) > 1;
-- There is no duplicates

-- Checking the number of NULL columns values in dailyactivity:
SELECT COUNT(*) - COUNT(id) as id,
COUNT(*) - COUNT(activitydate) as activitydate,
COUNT(*) - COUNT(totalsteps) as totalsteps,
COUNT(*) - COUNT(totaldistance) AS totaldistance,
COUNT(*) - COUNT(trackerdistance) as trackerdistance,
COUNT(*) - COUNT(loggedactivitiesdistance) as loggedactivitiesdistance,
COUNT(*) - COUNT(veryactivedistance) as veryactivedistance,
COUNT(*) - COUNT(moderatelyactivedistance) as moderatelyactivedistance,
COUNT(*) - COUNT(lightactivedistance) as lightactivedistance,
COUNT(*) - COUNT(sedentaryactivedistance) as sedentaryactivedistance,
COUNT(*) - COUNT(veryactiveminutes) as veryactiveminutes,
COUNT(*) - COUNT(fairlyactiveminutes) as fairlyactiveminutes,
COUNT(*) - COUNT(lightlyactiveminutes) as lightlyactiveminutes,
COUNT(*) - COUNT(sedentaryminutes) as sedentaryminutes,
COUNT(*) - COUNT(calories) as calories
FROM dailyactivity;
-- There is 0 empty columns

-- Checking the Length of id:
SELECT 
    personid,
    LENGTH(personid::TEXT) AS id_length
FROM dailyactivity
GROUP BY personid
ORDER BY id_length DESC;
-- Id is consistent with 10 characters

-- Checking the distinct values for tables dailyactivity, hourly_calories, hourly_data_merge, hourly_intensities,
-- hourly_steps, minutes_met_narrow and sleep_data:

-- Check distinct values for id in dailyactivity:
SELECT count(distinct(id)) FROM dailyactivity;
-- There is 33 distinct users for dailyactivity

-- Check distinct values for Id in hourly_calories:
SELECT count(distinct(id)) FROM hourly_calories;
-- There is 33 distinct Id values in hourly_calories

-- Check distinct values for Id in hourly_data_merge:
SELECT count(distinct(id)) FROM hourly_data_merge;
-- There is 33 distinct Id values for hourly_data_merge

-- Check distinct values for Id in hourly_intensities:
SELECT count(distinct(id)) FROM hourly_intensities;
-- There is 33 distinct Id values for hourly_intensities

-- Check distinct values for Id in hourly_steps:
SELECT count(distinct(id)) FROM hourly_steps;
-- There is 33 distinct Id values for hourly_steps

-- Check distinct values for Id in minutes_met_narrow:
SELECT count(distinct(id)) FROM minutes_met_narrow;
-- There is 33 distinct Id values for minutes_met_narrow

-- Check distinct values for Id in sleep_data:
SELECT count(distinct(id)) FROM sleep_data;
-- There is 24 distict Id values for sleep_data