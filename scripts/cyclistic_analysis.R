# -------------------------------------------------------------------------------
# CYCLISTIC BIKE SHARE CASE STUDY - FULL YEAR ANALYSIS (2025)
# Author: Stergos Kapros
# Date: 23 January 2026
# -------------------------------------------------------------------------------

library(tidyverse)
library(readxl)
library(lubridate)

# Set working directory to cleaned Excel files
setwd("C:/Users/Sterg/Desktop/Google Drive - PC/Career Folder/Portfolio & Projects/Cyclistic Project 2026/clean data")

# Load all Excel files from the folder
files <- list.files(pattern = "\\.xlsx$", full.names = TRUE)

# Combine all Excel sheets into one dataframe
all_trips <- files %>%
  map_dfr(~ read_excel(.x, sheet = 1, guess_max = 1000000))

# Keep only the necessary columns
all_trips <- all_trips %>%
  select(any_of(c(
    "ride_id", "rideable_type", "started_at", "ended_at",
    "start_station_name", "start_station_id",
    "end_station_name", "end_station_id",
    "start_lat", "start_lng", "end_lat", "end_lng",
    "member_casual"
  )))

# Convert to datetime and calculate ride length in minutes
all_trips <- all_trips %>%
  mutate(
    started_at = as.POSIXct(started_at, tz = "UTC"),
    ended_at = as.POSIXct(ended_at, tz = "UTC"),
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins"))
  )

# Clean data
all_trips <- all_trips %>%
  filter(
    !is.na(member_casual),
    !is.na(started_at),
    !is.na(ended_at),
    !is.na(ride_length),
    ride_length > 0,
    ride_length <= 1440
  )

# Add weekday and month columns
all_trips <- all_trips %>%
  mutate(
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE),
    month = month(started_at, label = TRUE, abbr = FALSE)
  )

# Summary statistics by user type
summary_by_user <- all_trips %>%
  group_by(member_casual) %>%
  summarise(
    average_ride = mean(ride_length, na.rm = TRUE),
    median_ride = median(ride_length, na.rm = TRUE),
    max_ride = max(ride_length, na.rm = TRUE),
    total_rides = n(),
    .groups = "drop"
  )

# Average ride by day of the week
avg_ride_by_day <- all_trips %>%
  group_by(member_casual, day_of_week) %>%
  summarise(
    avg_ride_length = mean(ride_length, na.rm = TRUE),
    total_rides = n(),
    .groups = "drop"
  )

# Average ride by month
avg_ride_by_month <- all_trips %>%
  group_by(member_casual, month) %>%
  summarise(
    avg_ride_length = mean(ride_length, na.rm = TRUE),
    total_rides = n(),
    .groups = "drop"
  )

# ---------------- VISUALIZATIONS ---------------- #

# Number of rides by user type
ggplot(all_trips, aes(x = member_casual, fill = member_casual)) +
  geom_bar() +
  labs(
    title = "Number of Rides by User Type",
    x = "User Type",
    y = "Total Rides"
  ) +
  theme_minimal()

# Average ride duration by user type
ggplot(summary_by_user, aes(x = member_casual, y = average_ride, fill = member_casual)) +
  geom_col() +
  labs(
    title = "Average Ride Length (minutes) by User Type",
    x = "User Type",
    y = "Average Ride Length"
  ) +
  theme_minimal()

# Average ride duration by day of week
ggplot(avg_ride_by_day, aes(x = day_of_week, y = avg_ride_length, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(
    title = "Average Ride Length by Day of Week",
    x = "Day of Week",
    y = "Average Ride (minutes)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Total rides by month
ggplot(avg_ride_by_month, aes(x = month, y = total_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(
    title = "Total Rides per Month (Members vs Casuals)",
    x = "Month",
    y = "Total Rides"
  ) +
  theme_minimal()

# ---------------- EXTRA ANALYSIS ---------------- #

# Top 5 Start Stations per User Type
top5_stations <- all_trips %>%
  filter(!is.na(start_station_name)) %>%
  group_by(member_casual, start_station_name) %>%
  summarise(rides = n(), .groups = "drop") %>%
  arrange(member_casual, desc(rides)) %>%
  group_by(member_casual) %>%
  slice_head(n = 5)

# Plot: Top 5 Start Stations (Simple Barplot)
ggplot(top5_stations, aes(x = reorder(start_station_name, rides), y = rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(
    title = "Top 5 Start Stations per User Type",
    x = "Start Station",
    y = "Number of Rides"
  ) +
  theme_minimal()

# ---------------- END ---------------- #
