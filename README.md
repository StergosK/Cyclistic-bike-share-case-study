# Cyclistic Bike Share Case Study

This project was completed as part of the **Google Data Analytics Professional Certificate (Coursera)**.

It analyzes Cyclistic bike-share usage over a 12-month period (January–December 2025), focusing on how different user types use the service and how these patterns can support marketing decisions.

## Business Question

How do casual riders and annual members use Cyclistic bikes differently?

## Data Description

Cyclistic is a fictional company used in the Google Data Analytics Capstone project.  
The data used for this analysis comes from **Divvy Trip Data**, which is publicly available, anonymized, and provided by **Motivate International Inc.** under the **City of Chicago Data License**.

The dataset contains individual trip records, including:
- ride start and end times  
- trip duration (ride length)  
- start station  
- rider type (casual rider or annual member)

**Data period:** January–December 2025 (12 months)  
**User types:** Casual riders, Annual members  

The dataset is **not included in this repository** due to file size and licensing constraints. The analysis script documents the full workflow used to clean and analyze the data.

## Data Cleaning

Initial cleaning and validation were performed in **Excel**, followed by analysis in R.  
Key steps included:
- removing rides with zero or negative duration  
- excluding trips longer than 24 hours  
- handling missing or invalid timestamps  
- standardizing date and time formats  

## Analysis Focus

The analysis examines:
- differences in ride duration between casual riders and members  
- usage patterns across days of the week  
- monthly ride volume and seasonality  
- most frequently used start stations by user type  

## Tools Used

- Excel (data cleaning and validation)  
- R / RStudio  
- tidyverse (dplyr, lubridate, ggplot2)

## Project Structure

The repository is organized as follows:
- `scripts/` contains the R script used for data cleaning, transformation, and analysis  
- `plots/` includes all charts generated during the analysis  
- `Cyclistic Bike Share Case Study.pdf` provides the full written case study with insights and recommendations  

## Key Insights

- Annual members complete more rides overall, indicating higher usage frequency.  
- Casual riders have longer average ride durations, suggesting more leisure-oriented usage.  
- Casual riders tend to take longer trips on weekends, while members show more consistent ride behavior throughout the week.  

## Results

All visualizations are available in the `plots` folder.  
A detailed explanation of the analysis and conclusions is provided in **Cyclistic Bike Share Case Study.pdf**.
