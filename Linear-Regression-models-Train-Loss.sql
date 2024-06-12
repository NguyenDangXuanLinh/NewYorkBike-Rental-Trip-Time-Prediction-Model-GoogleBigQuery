#Create Linear Regression Model with different features
-- Using MSE metrics to compare training loss and choose the best model performance (or features variables)

CREATE OR REPLACE MODEL`01_nyc_bike_sharing.trip_duration_by_stations` 
OPTIONS
  (MODEL_TYPE='linear_reg',
  INPUT_LABEL_COLS=['tripduration']) AS
SELECT start_station_name, end_station_name, tripduration 
FROM `01_nyc_bike_sharing.training_table`


-- Add 1 new feature
CREATE OR REPLACE MODEL 
  `01_nyc_bike_sharing.trip_duration_by_stations_and_day` 
OPTIONS
  (MODEL_TYPE='linear_reg',
  INPUT_LABEL_COLS=['tripduration']) AS
SELECT start_station_name, end_station_name, tripduration,
  IF (EXTRACT (DAYOFWEEK FROM starttime)= 1 OR
      EXTRACT (DAYOFWEEK FROM starttime)= 7, TRUE, FALSE) AS is_weekend
FROM `01_nyc_bike_sharing.training_table`;

-- Add 2 new features
CREATE OR REPLACE MODEL 
  `01_nyc_bike_sharing.trip_duration_by_stations_day_age` 
OPTIONS
  (MODEL_TYPE='linear_reg',
  INPUT_LABEL_COLS=['tripduration']) AS
SELECT start_station_name, end_station_name, tripduration,
  IF (EXTRACT (DAYOFWEEK FROM starttime)= 1 OR
      EXTRACT (DAYOFWEEK FROM starttime)= 7, TRUE, FALSE) AS is_weekend,
  EXTRACT (YEAR FROM starttime) - birth_year AS age
FROM `01_nyc_bike_sharing.training_table`;
