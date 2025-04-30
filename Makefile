IMAGE = insurance
REPORT = insurance.html

PROJECTFILES = insurance.Rmd \
               scripts/01_data_cleaning.R \
               scripts/02_summary.R \
               scripts/03_summary_figures.R \
               scripts/04_visualization.R \
               Makefile

RENVFILES = renv.lock renv/activate.R renv/settings.json

.PHONY: insurance_image
insurance_image: $(PROJECTFILES) $(RENVFILES)
	docker build -t $(IMAGE) .

.PHONY: final_report
final_report: insurance_image
	docker run --rm -v "$$(pwd)/outputs":/home/rstudio/project/outputs $(IMAGE)

.PHONY: report
report:
	Rscript scripts/01_data_cleaning.R
	Rscript scripts/02_summary.R
	Rscript scripts/03_summary_figures.R
	Rscript scripts/04_visualization.R
	Rscript -e "rmarkdown::render('insurance.Rmd', output_file = 'outputs/report.html')"

.PHONY: local_report
local_report: report

README.html: README.Rmd
	Rscript -e "rmarkdown::render('README.Rmd', output_format = 'html_document', output_file = 'README.html')"

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f outputs/* $(REPORT)
