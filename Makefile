insurance.html: insurance.Rmd scripts/01_data_cleaning.R scripts/02_summary.R scripts/03_summary_figures.R scripts/04_visualization.R
	Rscript scripts/01_data_cleaning.R
	Rscript scripts/02_summary.R
	Rscript scripts/03_summary_figures.R
	Rscript scripts/04_visualization.R

	Rscript -e "rmarkdown::render('insurance.Rmd')"



.PHONY: clean
clean:
	rm -f outputs/* && rm -f insurance.html