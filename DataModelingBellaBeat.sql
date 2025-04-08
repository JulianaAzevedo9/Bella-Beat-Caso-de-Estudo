-- CREATING TABLE
--create the table dailyactivity
CREATE TABLE dailyactivity (
    id BIGINT,
    activitydate DATE,
    totalsteps INTEGER,
    totaldistance NUMERIC(10, 2),
    trackerdistance NUMERIC(10, 2),
    loggedactivitiesdistance NUMERIC(10, 2),
    veryactivedistance NUMERIC(10, 2),
    moderatelyactivedistance NUMERIC(10, 2),
    lightactivedistance NUMERIC(10, 2),
    sedentaryactivedistance NUMERIC(10, 2),
    veryactiveminutes INTEGER,
    fairlyactiveminutes INTEGER,
    lightlyactiveminutes INTEGER,
    sedentaryminutes INTEGER,
    calories INTEGER
);

--Create table sleep_data
CREATE TABLE sleep_data (
    id BIGINT,
    sleep_date TIMESTAMP,
    total_sleep_records INTEGER,
    total_minutes_asleep INTEGER,
    total_time_in_bed INTEGER	

-- Create a table for hourly_calories
CREATE TABLE hourly_calories (
    id BIGINT,
    activity_hour TIMESTAMP,
    calories INTEGER
);

-- Create a table for hourly_intensities
CREATE TABLE hourly_intensities (
    id BIGINT,
    activity_hour TIMESTAMP,
    totalinstensity INTEGER,
	averageintensity FLOAT
);

--Create table for hourly_steps
CREATE TABLE hourly_steps(
id BIGINT,
activity_hour TIMESTAMP,
steptotal INTEGER
);

-- Create table for minutes_met_narrow
CREATE TABLE minutes_met_narrow (
    personid BIGINT,
    activity_minute TIMESTAMP,
    mets INTEGER
);
