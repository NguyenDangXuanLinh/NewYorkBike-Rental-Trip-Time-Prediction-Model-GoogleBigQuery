# Linear Regression with Prediction Features in Mobile Application 

## Problem Statement
New York City bike is a sharing services by Citi Bike. The company's goal is to crate a digital experience for a new pay-as-you-go rental options. 
Therefore, in the development of a new mobile application, they plan to add feature that enable customers to know the predicted average trip time and cost estimation for the ride if they provide their departure and arrival station. 

## Project Objectives
The goal of this project is to develop a predictive model that enable customers to know the predicted average trip time and cost estimation for the ride. By accurately predicting trip outcomes of a bike rental, customers can make informed decisions, thereby increasing customer's benefits and enhancing overall digital experience. 

## Dataset 
 The ML datasets have been collected and stored in a BigQuery public dataset `bigquery-public-data` under the name `new_york_citibike` dataset.
 
 The public dataset has 2 BigQuery tables. The one used is `citybike_trips` table.
 - The `tripduration` is our label -- indicates the duration expressed in seconds if each bike rental.
 - Other fields are potential features -- contains more than 58 million records.

## Methodology
The project follows a standard machine learning pipeline, which includes the following steps:

 - Data Preprocessing: Cleaning the dataset, handling missing values, tranform datetime variables, and feature scaling.
   
 - Model Selection: Using Power Query on BigQuery to split dataset into 3 sets to perform model selection and model evaluation. Months were used as a targeted measurement to split dataset. After that, trying out various machine learning algorithms and selecting the best-performing model based on evaluation metrics.
   
 - Model Evaluation: Assessing the model's performance using appropriate evaluation metrics and fine-tuning as necessary.

## Training Linear Regression model - Develop an effective asset with good performance
### Model Optimization: Improve the performance of our ML model multiple times with Loss function

 **Mean Squared Error** -- avgerage squared distance between actual values and predicted values of the label
 
1. ```ruby
    trip_duration_by_stations - MSE = 111.2176
   ```
<img width="50%" align="center" 
    src="https://github.com/NguyenDangXuanLinh/Predict-trip-time-for-NewYorkBikes-rental-services/blob/main/.images/evaluation_1.png">

    
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


## Conclusion 
The result of the **SELECT COUNT** query returns a value of :

 ```ruby
 1,548,371 Predictions, with a difference between the predicted, the actual value being Less Than 15 Minutes.
```
<img width="90%" align="center" 
    src="https://github.com/NguyenDangXuanLinh/Predict-trip-time-for-NewYorkBikes-rental-services/blob/main/.images/difference_predict.png">

    
### Considering that the total size of the prediction_table table is 1,728,078, we can say that:

```ruby
 In 89.6% Of Cases, our machine learning model is able to predict:

- The Trip Duration with a gap that's Less Than 15 Minutes.
- The Exact Fare of The Ride with Mean Absolute Error of 6,8 mins.
```

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
