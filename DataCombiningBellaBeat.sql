--Create new table to merge hourly_calories, hourly_intensities, and hourly_steps
CREATE TABLE hourly_data_merge (
    id NUMERIC(18, 0),
    date_new VARCHAR(50),       -- Use VARCHAR instead of NVARCHAR
    time_new INTEGER,           -- Use INTEGER instead of INT
    calories NUMERIC(18, 0),
    total_intensity NUMERIC(18, 0),
    average_intensity FLOAT,
    step_total NUMERIC(18, 0)
);

--Insert corresponsing data and merge multiple table into one table
INSERT INTO hourly_data_merge (
    id, 
    date_new, 
    time_new, 
    calories, 
    total_intensity, 
    average_intensity, 
    step_total
)
SELECT 
    temp1.id, 
    temp1.date_new, 
    temp1.time_new, 
    temp1.calories, 
    temp2.totalinstensity, 
    temp2.averageintensity, 
    temp3.steptotal
FROM 
    hourly_calories AS temp1
INNER JOIN 
    hourly_intensities AS temp2
    ON temp1.id = temp2.id 
    AND temp1.date_new = temp2.date_new 
    AND temp1.time_new = temp2.time_new 
INNER JOIN 
    hourly_steps AS temp3
    ON temp1.id = temp3.id 
    AND temp1.date_new = temp3.date_new 
    AND temp1.time_new = temp3.time_new;

-- Check for duplicates in hourly_data_merge
SELECT 
    id,
	date_new,
    time_new, 
    calories, 
    total_intensity, 
    average_intensity, 
    step_total, 
    COUNT(*) AS duplicates
FROM 
    hourly_data_merge
GROUP BY 
    id, 
	date_new,
    time_new, 
    calories, 
    total_intensity, 
    average_intensity, 
    step_total
HAVING 
    COUNT(*) > 1;
