library(tidyverse)
library(ggplot2)
library(here)

# Load cleaned data
data_path <- here("outputs", "cleaned_insurance.rds")
insurance <- readRDS(data_path)

# BMI vs. Charges by Smoking Status
p1 <- ggplot(insurance, aes(x = bmi, y = charges, color = smoker)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  labs(title = "BMI vs. Charges", x = "BMI", y = "Charges")

# Age vs. Charges
p2 <- ggplot(insurance, aes(x = age, y = charges, color = smoker)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  labs(title = "Age vs. Charges", x = "Age", y = "Charges")

# Save plots
ggsave(here("outputs", "bmi_vs_charges.png"), p1, width = 6, height = 4)
ggsave(here("outputs", "age_vs_charges.png"), p2, width = 6, height = 4)
