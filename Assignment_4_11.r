set.seed(0)
estimated_lambda <- 0.301204819277
num_samples <- 25
num_iterations <- 1e7
n <- num_samples
df_chisq <- 2 * n  # degrees of freedom for chi-sq

# Bootstrap simulation of lambda_hat
lambda_estimates <- replicate(num_iterations, {
  sample <- rexp(n, rate = estimated_lambda)
  1 / mean(sample)
})

# Transform to chi-square statistics T_b
T_values <- 2 * n * lambda_estimates / estimated_lambda

# KS test against chi-square df=2n
ks_result <- ks.test(T_values, "pchisq", df = df_chisq)
print(ks_result)

# Convert chi-square density into equivalent lambda density
lambda_vals <- seq(min(lambda_estimates), quantile(lambda_estimates, 0.999), length.out = 1000)
theoretical_density <- dchisq((2 * n * lambda_vals) / estimated_lambda, df = 2 * n) * (2 * n / estimated_lambda)

# Create two data frames: one for the empirical, one for the theoretical curve
df_empirical <- data.frame(lambda = lambda_estimates)
df_theoretical <- data.frame(lambda = lambda_vals, density = theoretical_density)

# Plot
library(ggplot2)

ggplot(df_empirical, aes(x = lambda)) +
  geom_density(fill = "#87CEFA", color = "#0B3C5D", alpha = 0.8) +
  geom_line(data = df_theoretical, aes(x = lambda, y = density), color = "#D7263D", size = 1.2) +
  labs(title = "Bootstrap Density of λ vs. Scaled Chi-square(50)",
       x = expression(lambda), y = "Density") +
  theme_minimal()
