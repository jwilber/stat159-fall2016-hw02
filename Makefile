.PHONY: all clean data

all: data eda-output.txt regression.RData report.pdf

data: 
	 curl -o data/Advertising.csv http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv



regression.RData: code/regression-script.R  data images
	Rscript $<; rm Rplots.pdf 

eda-output.txt: code/eda-script.R data images
	Rscript $<; rm Rplots.pdf  # why is Rplots.pdf being produced?

images:
	mkdir images

report.pdf: report/report.Rmd regression.RData report images/scatterplot-tv-sales.png
	pandoc $< --latex-engine=xelatex -o report/$@

clean:
	rm -rf report/report.pdf