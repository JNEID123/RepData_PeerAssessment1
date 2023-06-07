library(dplyr)
library(ggplot2)
library(lubridate)

# Adjust the file path to your data file
data <- read.csv("C:/Users/Owner/Documents/DataScience/Reproducible Research/Scripts/activity.csv")

# Calculate the total number of steps taken each day
total_steps_per_day <- data %>%
  group_by(date) %>%
  summarise(total_steps = sum(steps, na.rm = TRUE))

# Create a histogram of the total steps per day
ggplot(total_steps_per_day, aes(x = total_steps)) +
  geom_histogram(binwidth = 1000, fill = "blue", color = "black") +
  labs(title = "Histogram of Total Steps per Day", x = "Total Steps", y = "Frequency")

# Calculate the mean and median number of steps taken per day
mean_steps_per_day <- mean(total_steps_per_day$total_steps)
median_steps_per_day <- median(total_steps_per_day$total_steps)

# Create a time series plot of the average number of steps taken
average_steps_per_interval <- data %>%
  group_by(interval) %>%
  summarise(avg_steps = mean(steps, na.rm = TRUE))

ggplot(average_steps_per_interval, aes(x = interval, y = avg_steps)) +
  geom_line(color = "blue") +
  labs(title = "Time Series Plot of Average Steps per Interval", x = "Interval", y = "Average Steps")

# Determine the 5-minute interval with the maximum number of steps
max_steps_interval <- average_steps_per_interval$interval[which.max(average_steps_per_interval$avg_steps)]

# Impute missing data by replacing it with the average steps for the corresponding interval
data_imputed <- data
for (i in 1:nrow(data_imputed)) {
  if (is.na(data_imputed$steps[i])) {
    interval <- data_imputed$interval[i]
    data_imputed$steps[i] <- average_steps_per_interval$avg_steps[average_steps_per_interval$interval == interval]
  }
}

# Create a histogram of the total steps per day after imputation
total_steps_per_day_imputed <- data_imputed %>%
  group_by(date) %>%
  summarise(total_steps = sum(steps))

ggplot(total_steps_per_day_imputed, aes(x = total_steps)) +
  geom_histogram(binwidth = 1000, fill = "blue", color = "black") +
  labs(title = "Histogram of Total Steps per Day (After Imputation)", x = "Total Steps", y = "Frequency")

# Create a panel plot comparing the average steps per interval across weekdays and weekends
data_imputed$date <- as.Date(data_imputed$date)
data_imputed$day_type <- ifelse(weekdays(data_imputed$date) %in% c("Saturday", "Sunday"), "weekend", "weekday")

average_steps_per_interval_day_type <- data_imputed %>%
  group_by(interval, day_type) %>%
  summarise(avg_steps = mean(steps))

ggplot(average_steps_per_interval_day_type, aes(x = interval, y = avg_steps)) +
  geom_line() +
  facet_grid(day_type ~ .) +
  labs(title = "Average Steps per Interval: Weekday vs Weekend", x = "Interval", y = "Average Steps")

