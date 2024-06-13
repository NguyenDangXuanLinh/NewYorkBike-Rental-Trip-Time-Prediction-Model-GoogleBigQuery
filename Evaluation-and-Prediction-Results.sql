# Evaluate ML performance
-- ML key performance calculated on evaluation table using ML.EVALUATE function.

SELECT 
*
FROM ML.EVALUATE (
  MODEL `01_nyc_bike_sharing.trip_duration_by_stations_and_day`,
  (SELECT start_station_name, end_station_name, tripduration,
          IF (EXTRACT(DAYOFWEEK FROM starttime) =1 OR
              EXTRACT(DAYOFWEEK FROM starttime) =7, TRUE, FALSE) AS is_weekend
    FROM 
        `01_nyc_bike_sharing.evaluation_table`));


# Predict the duration of a bike rental

  SELECT tripduration AS actual_duration,
      predicted_tripduration AS predicted_duration,
      ABS(tripduration - predicted_tripduration) AS difference_in_min
FROM ML.PREDICT 
  (MODEL `01_nyc_bike_sharing.trip_duration_by_stations_and_day`,
  (SELECT start_station_name, end_station_name, tripduration,
          IF (EXTRACT(DAYOFWEEK FROM starttime) =1 OR
              EXTRACT(DAYOFWEEK FROM starttime) =7, TRUE, FALSE) AS is_weekend
    FROM 
        `01_nyc_bike_sharing.prediction_table`))
ORDER BY difference_in_min ASC;

# Conclusion
SELECT COUNT(*)
FROM (
SELECT tripduration AS actual_duration,
      predicted_tripduration AS predicted_duration,
      ABS(tripduration - predicted_tripduration) AS difference_in_min
FROM ML.PREDICT 
  (MODEL `01_nyc_bike_sharing.trip_duration_by_stations_and_day`,
  (SELECT start_station_name, end_station_name, tripduration,
          IF (EXTRACT(DAYOFWEEK FROM starttime) =1 OR
              EXTRACT(DAYOFWEEK FROM starttime) =7, TRUE, FALSE) AS is_weekend
    FROM 
        `01_nyc_bike_sharing.prediction_table`))
ORDER BY difference_in_min ASC)
WHERE difference_in_min<=15;
