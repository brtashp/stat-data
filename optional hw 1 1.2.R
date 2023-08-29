# optional hw 1 1.2 
library(ggplot2)
geico <- c(4.7, 8.3, 9.2)
progressive <- c(7.4, 6.7, 8.9)
usaa <- c(3.8, 6.3, 8.1)
data <- data.frame(
  Group = rep(c("Geico", "Progressive", "USAA"), each = 3),
  Value = c(4.7, 8.3, 9.2, 7.4, 6.7, 8.9, 3.8, 6.3, 8.1)
)

# Calculate the mean value for each group
mean_geico <- mean(geico)
mean_progressive <- mean(progressive)
mean_usaa <- mean(usaa)

# Compare means to find the best group
best_group <- which.max(c(mean_geico, mean_progressive, mean_usaa))

# Print the results
cat("Mean values - Geico:", mean_geico, "\n")
cat("Mean values - Progressive:", mean_progressive, "\n")
cat("Mean values - USAA:", mean_usaa, "\n")
cat("Group with the highest mean value: ", c("Geico", "Progressive", "USAA")[best_group])

ggplot(data, aes(x = Group, y = Value, fill = Group)) +
  geom_boxplot() +
  labs(title = "Box Plot Comparison of Values", x = "Group", y = "Value") +
  scale_fill_discrete(name = "Group")
