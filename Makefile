.PHONY: all clean data

all: data eda-output.txt regression.RData report.pdf

data: 
	 curl -o data/Advertising.csv http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

report.pdf: report/report.Rmd regression.RData report
	pandoc report/report.Rmd --latex-engine=xelatex -o report/report.pdf 

regression.RData: code/regression-script.R  data
	Rscript $<; rm Rplots.pdf 

eda-output.txt: code/eda-script.R data
	Rscript $<; rm Rplots.pdf  # why is Rplots.pdf being produced?

clean:
	rm -rf report.pdf