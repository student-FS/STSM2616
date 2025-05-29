import numpy as np
import scipy.stats as stats

# Given data
d = np.array([2.30,1.60,1.50,1.50,3.94,2.66,1.29,2.36,2.0,0.41,
              0.88,2.08,3.74,1.51,1.23,1.85,1.18,1.45,1.72,0.85,
              2.73,0.75,0.69,1.95,2.62])

# Number of bootstrap resamples
B = 100000
n = len(d)

# Bootstrap estimates of alpha using method of moments: alpha = (mean^2) / variance
alpha_bootstrap = []
rng = np.random.default_rng(seed=42)  # for reproducibility

for _ in range(B):
    sample = rng.choice(d, size=n, replace=True)
    sample_mean = np.mean(sample)
    sample_var = np.var(sample, ddof=1)
    alpha_hat = sample_mean**2 / sample_var
    alpha_bootstrap.append(alpha_hat)

# Compute 95% percentile CI
ci_lower = np.percentile(alpha_bootstrap, 2.5)
ci_upper = np.percentile(alpha_bootstrap, 97.5)

print(ci_lower, ci_upper)
