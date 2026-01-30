# Cyclistic bike share case study (2025)

Capstone project for the Google Data Analytics Professional Certificate (Coursera).  
Analysis of Divvy trips (Jan–Dec 2025) to compare **casual riders** vs **annual members** and support marketing decisions.

## business question
How do casual riders and annual members use Cyclistic bikes differently?

## data
Public, anonymized Divvy Trip Data (City of Chicago Data License).  
Raw data isn’t included here due to size/licensing.

## cleaning
Excel:
- removed zero/negative durations
- excluded rides > 24h
- fixed missing/invalid timestamps
- standardized date/time formats

## analysis
R (tidyverse): ride length, day-of-week patterns, seasonality, top start stations.

## key insights
- Members take more rides overall
- Casual riders have longer rides
- Casual rides are longest on weekends and peak in summer

## repository
- `scripts/` R analysis
- `plots/` charts
- `Cyclistic Bike Share Case Study.pdf` full write-up
