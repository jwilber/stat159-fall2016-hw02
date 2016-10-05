.PHONY: all clean data

all: data eda-output.txt regression.RData

data: 
	 curl -o data/Advertising.csv http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

report.pdf: report.Rmd regression.RData scatterplot-tv-sale.png

regression.RData: code/regression-script.R  data
	Rscript $<

eda-output.txt: code/eda-script.R data
	Rscript $<; rm Rplots.pdf  # why is Rplots.pdf being produced?

clean:
	rm -rf report.pdf