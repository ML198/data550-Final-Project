# Insurance Charges Analysis Report

Mingrui Li

## Repository Contents

-   `insurance.Rmd` – The main RMarkdown file for the report.
-   `scripts/` – Contains R scripts for data cleaning, summary statistics, and visualizations.
-   `data/` – Input data files used in the analysis.
-   `renv.lock`, `renv/` – Dependency lockfile and configuration for reproducible environments.
-   `Makefile` – Provides convenient targets for building and running the report.
-   `Dockerfile` – Builds a Docker image with all dependencies and report automation.
-   `report` - Output HTML report (generated)

## How to Build the Docker Image (Optional for local testing)

To build the Docker image locally (only if needed):

```bash
make insurance_image
```

## How to Generate the Report

Ensure you have **Docker** installed. Then run:

``` bash
make final_report
```

This will:

-   Pull the prebuilt Docker image from DockerHub: mingruili02/insurance:latest

-   Run the analysis and render the report

-   Save the final HTML to the local report/ folder

To remove output files: `make clean`

## Key Components

-   **Table Creation**: Regional summary table code in `scripts/02_summary.R`
-   **Figure Creation**:
    -   Distribution plots: `scripts/03_summary_figures.R`
    -   Relationship plots: `scripts/04_visualization.R`

## Report Description

The report explores medical insurance charges and their relationship with:

-   Region: Regional cost comparison

-   Demographics: Age, sex, BMI distribution

-   Predictors of Cost: BMI and age vs insurance charges
