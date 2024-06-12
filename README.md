# Linear Regression with Prediction Features in Mobile Application 

## Problem Statement
New YOrk City bike is a sharing services by Citi Bike. The company's goal is to crate a digotal experience for a new pay-as-you-go rental options. 
Therefore, in the development of a new mobile application, they plan to add feature that enable customers to know the predicted average trip time 
and cost estimation for the ride if they provide their departure and arrival station. 

The ML project uses Linear Regression to predict a numeric value such as the trip time of a bike rental for a new prediction system in mobile application.
<br>


## Dataset 
 The ML datasets have been collected and stored in a BigQuery public dataset `bigquery-public-data` under the name `new_york_citibike` dataset.
 The public dataset has 2 BigQuery tebles. The one used is `citybike_trips` table.
 - The `tripduration` is our label -- indicates the duration expressed in seconds if each bike rental.
 - Other fields are potntial features -- contains more than 58 million records.

## Data Quality
