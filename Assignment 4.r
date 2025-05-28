library(ggplot2)
d=c(1.88, 12.04, 5.27, 3.65, 0.68, 0.68, 0.24, 8.04, 3.68, 4.93, 0.08, 14.01, 7.15, 0.95, 0.8, 0.81, 1.45, 2.98, 2.26, 1.38, 3.79, 0.6, 1.38, 1.83, 2.44)
df <- data.frame(session_time = d)
ggplot(df, aes(x = session_time)) +
  geom_density(fill = "steelblue", alpha = 0.6, color = "darkblue") +
  geom_rug(sides = "b", color = "gray40") +
  labs(title = "Density Plot of User Session Times",
    x = "Session Time (minutes)",y = "Density") +theme_minimal()
