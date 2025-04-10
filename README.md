# Insurance Charges Analysis Report

Mingrui Li

## Repository Contents

```         
├── data/            # Raw insurance data
├── scripts/         # Analysis scripts
├── outputs/         # Generated outputs
├── report.Rmd       # Final report source
└── Makefile         # Build automation
```

## How to Generate the Report

1.  Install requirements:

``` bash
Rscript -e "install.packages(c('tidyverse', 'ggplot2', 'here', 'png', 'knitr', 'patchwork'), repos = 'https://cloud.r-project.org')"
```

2.  Run make command:

``` bash
make clean 
make insurance.html
```

## Key Components

-   **Table Creation**: Regional summary table code in `scripts/02_summary.R`
-   **Figure Creation**:
    -   Distribution plots: `scripts/03_summary_figures.R`
    -   Relationship plots: `scripts/04_visualization.R`

## Report Description

Explores medical insurance charges patterns through: - Regional cost comparisons - Demographic distributions - BMI/age vs charges relationships
