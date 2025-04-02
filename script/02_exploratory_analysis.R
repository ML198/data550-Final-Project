library(tidyverse)
library(here)

# Load cleaned data
data_path <- here("output", "cleaned_insurance.rds")
insurance <- readRDS(data_path)

# Summary statistics
summary_table <- insurance %>%
  summarise(
    avg_age = mean(age, na.rm = TRUE),
    avg_bmi = mean(bmi, na.rm = TRUE),
    avg_charges = mean(charges, na.rm = TRUE),
    smoker_rate = mean(smoker == "yes"),
    male_ratio = mean(sex == "male")
  )

# Save summary statistics
output_path <- here("output", "summary_table.rds")
saveRDS(summary_table, output_path)
