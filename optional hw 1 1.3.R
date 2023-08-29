khan <- c(6, 6.8, 7.4)
kher <- c(7.1, 2.6)
kapoor <- c(6.0, 6.0)

actor_ratings <- data.frame(
  Actor = rep(c("Khan", "Kher", "Kapoor"), times = c(length(khan), length(kher), length(kapoor))),
  Rating = c(khan, kher, kapoor)
)

# Calculate overall scores for each actor
overall_score <- c(mean(khan), mean(kher), mean(kapoor))

# Create a dataframe
actor_scores <- data.frame(
  Actor = c("Khan", "Kher", "Kapoor"),
  Overall_Score = overall_score
)

# Print the dataframe
print(actor_scores)