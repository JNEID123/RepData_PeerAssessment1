PA1_template
================

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Including Code

You can include R code in the document as follows: summary(data)

## Including Plots

You can also embed plots, for example:

# Create a histogram of the total steps per day

# Your plotting code goes here

# Create a histogram of the total steps per day

# Create a histogram of the total steps per day

> ggplot(total_steps_per_day, aes(x = total_steps)) + +
> geom_histogram(binwidth = 1000, fill = “blue”, color = “black”) + +
> labs(title = “Histogram of Total Steps per Day”, x = “Total Steps”, y
> = “Frequency”)
>
> # Create a time series plot of the average number of steps taken
>
> ggplot(average_steps_per_interval, aes(x = interval, y =
> avg_steps)) + + geom_line(color = “blue”) + + labs(title = “Time
> Series Plot of Average Steps per Interval”, x = “Interval”, y =
> “Average Steps”)
>
> # Create a histogram of the total steps per day after imputation
>
> ggplot(total_steps_per_day_imputed, aes(x = total_steps)) + +
> geom_histogram(binwidth = 1000, fill = “blue”, color = “black”) + +
> labs(title = “Histogram of Total Steps per Day (After Imputation)”, x
> = “Total Steps”, y = “Frequency”)
>
> # Create a panel plot comparing the average steps per interval across weekdays and weekends
>
> ggplot(average_steps_per_interval_day_type, aes(x = interval, y =
> avg_steps)) + + geom_line() + + facet_grid(day_type \~ .) + +
> labs(title = “Average Steps per Interval: Weekday vs Weekend”, x =
> “Interval”, y = “Average Steps”)

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
