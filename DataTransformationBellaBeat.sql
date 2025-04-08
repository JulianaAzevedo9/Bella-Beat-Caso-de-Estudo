-- Data Transformation
-- Add day_0f_week column on daily_activities
ALTER TABLE dailyactivity
ADD COLUMN day_of_week VARCHAR(50);

--Extract datename from ActivityDate
UPDATE dailyactivity
SET day_of_week = TO_CHAR(activitydate, 'Day');

-- Add sleep-related columns to daily_activity table
ALTER TABLE dailyactivity
ADD COLUMN total_minutes_sleep INT,
ADD COLUMN total_time_in_bed INT;

-- Update sleep records in daily_activity from sleep_data table
UPDATE dailyactivity
SET 
    total_minutes_sleep = sd.total_minutes_asleep,
    total_time_in_bed = sd.total_time_in_bed
FROM sleep_data sd
WHERE 
    dailyactivity.personid = sd.id 
    AND dailyactivity.activitydate = DATE(sd.sleep_date);

-- Split date and time for hourly_calories
-- Step 1: Add new columns
ALTER TABLE hourly_calories
ADD COLUMN time_new INT,
ADD COLUMN date_new DATE;

-- Step 2: Update new columns based on ActivityHour
UPDATE hourly_calories
SET time_new = EXTRACT(HOUR FROM activity_hour),
    date_new = activity_hour::DATE;

-- Split date and time for hourly_intensities
-- Step 1: Add new columns
ALTER TABLE hourly_intensities
ADD COLUMN time_new INT,
ADD COLUMN date_new DATE;

-- Step 2: Update new columns based on activity_hour
UPDATE hourly_intensities
SET time_new = EXTRACT(HOUR FROM activity_hour),
    date_new = activity_hour::DATE;

--Split date and time seperately for hourly_steps
-- Step 1: Add new columns
ALTER TABLE hourly_steps
ADD COLUMN time_new INT,
ADD COLUMN date_new DATE;

-- Step 2: Update new columns based on ActivityHour
UPDATE hourly_steps
SET time_new = EXTRACT(HOUR FROM activity_hour),
    date_new = activity_hour::DATE;

--Split date and time seperately for minute_METs_narrow
-- Step 1: Add new columns
ALTER TABLE minutes_met_narrow
ADD COLUMN time_new TIME,
ADD COLUMN date_new DATE;

-- Step 2: Update the new columns based on ActivityMinute
UPDATE minutes_met_narrow
SET 
    time_new = CAST(activity_minute AS TIME),
    date_new = CAST(activity_minute AS DATE);


