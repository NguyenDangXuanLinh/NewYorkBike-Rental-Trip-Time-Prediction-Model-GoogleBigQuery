# Linear Regression with Prediction Features in Mobile Application 

## Project Objectives
The goal of this project is to develop a predictive model that enable customers to know the predicted average trip time and cost estimation for the ride if they provide their departure and arrival station. 
By accurately predicting trip outcomes of a bike rental, customers can make informed decisions, thereby increasing customer's benefits and enhancing overall digital experience. 

## Dataset 
 The project used `new_york_citibike` dataset in BigQuery public dataset. The one used is `citybike_trips` table.
 - The `tripduration` is our label -- indicates the duration expressed in seconds if each bike rental.
 - Other fields are potential features -- contains more than 58 million records.
## Methodology
 - Data Preprocessing: Cleaning, handling missing values and tranforming datetime variables, and feature scaling.   
 - Model Selection: split dataset into 3 sets - for model selection, evaluation, and test purposes. Months were used as a targeted measurement to split dataset. 
 - Model Evaluation: Assessing the model's performance using appropriate evaluation metrics and fine-tuning as necessary.
## Train Linear Regression model - Develop an effective asset with Loss function - MSE
### Model Optimization: Improve the performance of our ML model multiple times with **Mean Squared Error***
*(avgerage squared distance between actual values and predicted values of the label)
 
1. ```ruby
    trip_duration_by_stations - MSE = 111.2176
   ```
<img width="50%" align="center" 
    src="https://github.com/NguyenDangXuanLinh/Predict-trip-time-for-NewYorkBikes-rental-services/blob/main/.images/evaluation_1.png">

## The chosen model     
2. ```ruby
   trip_duration_by_stations_and_day - MSE = 98.0522
   ```
   
<img width="50%"  align="center" 
    src="https://github.com/NguyenDangXuanLinh/Predict-trip-time-for-NewYorkBikes-rental-services/blob/main/.images/evaluation_2.png">


3. ```ruby
   trip_duration_by_stations_day_age - MSE = 110.8004
   ```
   
<img width="50%" align="center" 
    src="https://github.com/NguyenDangXuanLinh/Predict-trip-time-for-NewYorkBikes-rental-services/blob/main/.images/evaluation_3.png">


# Conclusion 
## Chosen model prediction results
The result of the **SELECT COUNT** query returns a value of :
 **1,548,371 predictions**, with a difference between the predicted, the actual value being** Less Than 15 Minutes**.
<img width="90%" align="center" 
    src="https://github.com/NguyenDangXuanLinh/Predict-trip-time-for-NewYorkBikes-rental-services/blob/main/.images/difference_predict.png">

## The interpretation of results 
Considering that the total size of the `prediction_table` is 1,728,078, we can say that:
 In 89.6% Of Cases, our linear regeression model is able to predict
- The Trip Duration with a gap that's Less Than 15 Minutes.
- The Exact Fare of The Ride with Mean Absolute Error of 6,8 mins.

## Actionable Recommendations
From the conclusion, here are some recommendations we provide for the new on-demand and pay-as-you-go pricing model strategy:

| Recommendations| Description For The Model In Mobile Application|
| --- | --- |
| Pricing Model Strategy | Pricing start with quarterly fare for pricing model with recurring payments  |
| Prediction Trip User Stories | when a customer picks up a bike **from a start station** and **specifies its destination** on the mobile application **on a specific day of the week**. |
| Prediction Trip Duration Confident | Our model will be able to **predict the trip duration** with a with a gap less than 15 minutes.|
| Model Performance Confident|  Our model will be able to **predict the exact fare of the ride** with a **mean absolute error of about 6.8 minutes**|
| Price Prediction Confident | We confident that 89.6% the application will provide a good estimation of the price to our customers|


<img width="100%"  align="center" 
    src="https://github.com/NguyenDangXuanLinh/Predict-trip-time-for-NewYorkBikes-rental-services/blob/main/.images/final_eval.png">


## Author
- Nguyen Dang Xuan Linh - [GitHub Profile](https://github.com/NguyenDangXuanLinh)
