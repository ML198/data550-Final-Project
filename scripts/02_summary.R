library(tidyverse)
library(here)

here::i_am("scripts/02_summary.R")

# Load cleaned data
insurance <- readRDS(here::here("outputs", "cleaned_insurance.rds"))

# Create and save summary table
region_summary <- insurance |>
  group_by(region) |>
  summarize(
    `Average Charges` = mean(charges),
    `Max Charges` = max(charges),
    `Records Count` = n()
  ) |>
  arrange(desc(`Average Charges`))

saveRDS(region_summary, here("outputs", "region_summary.rds"))
