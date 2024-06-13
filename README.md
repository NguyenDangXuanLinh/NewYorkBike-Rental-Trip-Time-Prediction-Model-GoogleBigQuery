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

## Training linear regression model - develop an effective asset with good performance
### Model Optimization: Improve the performance of our ML model multiple times with Loss function
 **Mean Squared Error** -- avgerage squared distance between actual values and predicted values of the label
1. ``` trip_duration_by_stations MSE = 111.2176```

2. ``` trip_duration_by_stations_and_day MSE = 98.0522```

3. ``` trip_duration_by_stations_day_age MSE = 110.8004```


## Conclusion 
The result of the **SELECT COUNT** query returns a value of :

- **1,548,371 predictions**, with a difference between the predicted and the actual value being **less than 15 minutes**.

Considering that the total size of the prediction_table table is 1,728,078, we can say that:

- in 89.6% of cases, our machine learning model is able to predict the trip duration with a gap that's less than 15 minutes.

> [!IMPORTANT Actionable Recommendations]
> Key information users need to know to achieve their goal.

## Actionable Recommendation
From the conclusion, here are some recommendations we provide for the new on-demand and pay-as-you-go pricing model strategy:

- We suggest that pricing start with `**quarterly fare**	#8B0000` for pricing model with recurring payments in the new mobile application.
- Featuring user story, we suggest that "when a customer picks up a bike **from a start station** and **specifies its destination** on the mobile application **on a specific day of the week**, our model will be able to **predict the exact fare of the ride** with a **mean absolute error of about 6.8 minutes**".
- We confident that 89.6% the application will provide a good estimation of the price to our customers.







