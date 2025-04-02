library(tidyverse)
library(here)

# Set paths
data_path <- here("data", "insurance.csv")
output_path <- here("output", "cleaned_insurance.rds")

# Load data
insurance <- read_csv(data_path)

# Convert categorical variables to factors
insurance <- insurance %>%
  mutate(
    sex = as.factor(sex),
    smoker = as.factor(smoker),
    region = as.factor(region)
  )

# Save cleaned data
saveRDS(insurance, output_path)
