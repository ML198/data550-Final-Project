library(tidyverse)
library(ggplot2)
library(patchwork)
library(here)

here::i_am("scripts/03_summary_figures.R")

insurance <- readRDS(here::here("outputs", "cleaned_insurance.rds"))

# Create all figures
# Numerical variables plot
num_vars <- insurance %>% 
  select(age, bmi, children, charges) %>%
  pivot_longer(cols = everything(), names_to = "variable", values_to = "value")

plots <- num_vars %>% 
  split(.$variable) %>%  # Split the data by variable
  map(~ggplot(.x, aes(x = value)) +   # Use .x to refer to the current subset
        geom_histogram(fill = "steelblue", bins = 20) +
        theme_minimal() +
        labs(x = NULL, y = "Count", title = unique(.x$variable)))  
# Combine all plots into one figure
p1 <- wrap_plots(plots, ncol = 2) + 
  plot_annotation(title = "Distribution of Numerical Variables", 
                  theme = theme(axis.text.x = element_text(angle = 45, hjust = 1),
                                plot.title = element_text(hjust = 0.5)))

# Categorical variables plot
cat_vars <- insurance %>% select(sex, smoker, region, bmi_class)

plots <- map2(cat_vars, names(cat_vars), ~ggplot(data.frame(x = .x), aes(x)) +
                geom_bar(fill = "darkorange") +
                theme_minimal() +
                labs(x = NULL, y = "Count", title = paste(.y)))

# Combine all plots into one figure
p2 <- wrap_plots(plots, ncol = 2) + 
  plot_annotation(title = "Distribution of Categorical Variables", 
                  theme = theme(axis.text.x = element_text(angle = 45, hjust = 1),
                                plot.title = element_text(hjust = 0.5)))

# Save plots
ggsave(here("outputs", "numerical_dist.png"), p1)
ggsave(here("outputs", "categorical_dist.png"),p2)
