# Prepare Data for Linear Regression

## Create 3 tables for LR model

-- Segmenting the dataset

-- Extract the Month and Year from starttime to know the time when the bike trip started
-- Exclude the bad records from the exploration stage and choose year 2017 and 2018
-- Exclude `tripduration` column outliers by limit duration from min 3 mins and max 3 hours
-- Filter customers empty year of birth from `birth_year` and exclude customers born after 2007.

SELECT EXTRACT (YEAR FROM `starttime`) AS year,
        EXTRACT (MONTH FROM starttime) AS month,
        COUNT(*) AS total
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE EXTRACT (YEAR FROM starttime)=2017 OR
        EXTRACT (YEAR FROM starttime)=2018 AND
        (tripduration>=3*60 AND tripduration <=3*60*60) AND
        birth_year is not NULL AND
        birth_year < 2007
GROUP BY year, month;

# Create ML model datasets
-- We will use the time frames as a data point to split dataset into 3 tables

# Training_table
-- Include all records from April 2017 to Feburary 2018.

CREATE OR REPLACE TABLE `01_nyc_bike_sharing.training_table` AS
SELECT tripduration/60 as tripduration,
        starttime,
        stoptime,
        start_station_id, start_station_latitude, start_station_longitude, start_station_name,
        end_station_id, end_station_latitude, end_station_longitude, end_station_name,
        bikeid,
        usertype,
        birth_year,
        gender,
        customer_plan
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE (
    (EXTRACT (YEAR FROM starttime)=2017 AND
    (EXTRACT (MONTH FROM starttime) >= 04 OR
    EXTRACT (MONTH FROM starttime)<= 10))
    OR(
    EXTRACT (YEAR FROM starttime)=2018 AND
    (EXTRACT (MONTH FROM starttime) >= 01 OR
    EXTRACT (MONTH FROM starttime)<= 02))
)
AND (tripduration>= 3*60 AND tripduration<=3*60*60)
AND birth_year is not NULL
AND birth_year < 2007;

# Evaluattion_table
-- Include all records from March and April 2018


CREATE OR REPLACE TABLE `01_nyc_bike_sharing.evaluation_table` AS
SELECT tripduration/60 as tripduration,
        starttime,
        stoptime,
        start_station_id, start_station_latitude, start_station_longitude, start_station_name,
        end_station_id, end_station_latitude, end_station_longitude, end_station_name,
        bikeid,
        usertype,
        birth_year,
        gender,
        customer_plan
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE 
    (EXTRACT (YEAR FROM starttime)=2018 AND
    (EXTRACT (MONTH FROM starttime) = 03 OR
    EXTRACT (MONTH FROM starttime)= 04))
AND (tripduration>= 3*60 AND tripduration<=3*60*60)
AND birth_year is not NULL
AND birth_year < 2007;


# Prediction_table
-- Include all records only from the month of May 2018

CREATE OR REPLACE TABLE `01_nyc_bike_sharing.prediction_table` AS
SELECT tripduration/60 as tripduration,
        starttime,
        stoptime,
        start_station_id, start_station_latitude, start_station_longitude, start_station_name,
        end_station_id, end_station_latitude, end_station_longitude, end_station_name,
        bikeid,
        usertype,
        birth_year,
        gender,
        customer_plan
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE 
    (EXTRACT (YEAR FROM starttime)= 2018 AND
    EXTRACT (MONTH FROM starttime) = 05 )
    AND (tripduration>= 3*60 AND tripduration<=3*60*60)
    AND birth_year is not NULL
    AND birth_year < 2007;
