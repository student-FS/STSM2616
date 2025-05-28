import numpy as np

# Given parameters
alpha = 4.12991
beta = 2.30515
sample_size = 25
num_bootstrap = 10_000_000

# The mean of a Gamma(alpha, beta) is alpha / beta
true_mean = alpha / beta

# Function to generate one sample and compute its mean
def sample_mean():
    sample = np.random.gamma(shape=alpha, scale=1/beta, size=sample_size)
    return sample.mean()

# Generate bootstrap sample means
bootstrap_means = np.array([sample_mean() for _ in range(num_bootstrap)])

# Calculate 95% confidence interval from bootstrap distribution
lower_bound = np.percentile(bootstrap_means, 2.5)
upper_bound = np.percentile(bootstrap_means, 97.5)

print(f"True mean: {true_mean:.5f}")
print(f"Bootstrap 95% CI for mean from {num_bootstrap} samples of size {sample_size}:")
print(f"[{lower_bound:.5f}, {upper_bound:.5f}]")
