# Load required libraries
library(dplyr)     # For data manipulation
library(ggplot2)   # For data visualization
library(stats)     # For ANOVA and Kruskal-Wallis tests

# Data Exploration and Preparation
data <- read.csv("OA 1.1 stat data.txt")  # Read your dataset

# Data Visualization
# Scatter plot of weight vs. feed
ggplot(data, aes(x = weight, y = factor(feed))) +
  geom_point(aes(color = feed)) +
  labs(x = "Weight", y = "Feed", title = "Scatter Plot of Weight vs. Feed")

# Box plot of weight by feed
ggplot(data, aes(x = factor(feed), y = weight, fill = feed)) +
  geom_boxplot() +
  labs(x = "Feed", y = "Weight", title = "Box Plot of Weight by Feed") +
  theme(legend.position = "none")  # Hide legend for better view

anova_result <- aov(weight ~ feed, data = data)

summary(anova_result)