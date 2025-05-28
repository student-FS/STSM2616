set.seed(0)
estimated_lambda <- 0.301204819277
num_samples <- 25
num_iterations <- 1e7
n <- num_samples
df_chisq <- 2*n # degrees of freedom for chi-sq

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

