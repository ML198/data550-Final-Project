insurance.html: insurance.Rmd scripts/01_data_cleaning.R scripts/02_summary.R scripts/03_summary_figures.R scripts/04_visualization.R
	Rscript scripts/01_data_cleaning.R
	Rscript scripts/02_summary.R
	Rscript scripts/03_summary_figures.R
	Rscript scripts/04_visualization.R

	Rscript -e "rmarkdown::render('insurance.Rmd')"
	
README.html:README.Rmd
	rmarkdown::render("README.Rmd", output_format = "html_document", output_file = "README.html")


.PHONY: clean
clean:
	rm -f outputs/* && rm -f insurance.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"