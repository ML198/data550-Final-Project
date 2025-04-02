library(tidyverse)
library(here)

here::i_am("scripts/01_data_cleaning.R")
# Load and clean data
insurance <- read.csv(here::here("data/insurance.csv")) |>
  mutate(
    sex = factor(sex),
    smoker = factor(smoker),
    region = factor(region),
    bmi_class = cut(bmi, breaks = c(0, 18.5, 25, 30, Inf),
                    labels = c("Underweight", "Normal", "Overweight", "Obese"))
  )

saveRDS(insurance, here("outputs", "cleaned_insurance.rds"))

