CREATE OR REPLACE MODEL`01_nyc_bike_sharing.trip_duration_by_stations` 
  OPTIONS(model_type='linear_reg',input_label_cols=['tripduration'])
AS SELECT start_station_name, end_station_name, tripduration
FROM `01_nyc_bike_sharing.training_table`
