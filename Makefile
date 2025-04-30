IMAGE = mingruili02/insurance:latest
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
final_report:
	docker run --rm -v "$$(pwd)/report":/home/rstudio/project/report $(IMAGE)

.PHONY: report
report:
	mkdir -p report
	mkdir -p outputs
	Rscript scripts/01_data_cleaning.R
	Rscript scripts/02_summary.R
	Rscript scripts/03_summary_figures.R
	Rscript scripts/04_visualization.R
	Rscript -e "rmarkdown::render('insurance.Rmd', output_file = 'report/report.html')"

.PHONY: local_report
local_report: report

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -rf outputs report
