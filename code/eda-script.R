# -------------- eda-script.R ------------------
# Reads in the Advertising.csv data set, and computes summary statistics and histograms 
# of TV and Sales. The summary statistics should be clearly labeled, and will be saved in a file 
# eda-output.txt. The charts are saved in both PNG and PDF formats.
library(ggplot2)
library(ggthemes)
setwd("~/Desktop/stat159/hw2/stat159-fall2016-hw02/data/")
adv      <- read.csv('Advertising.csv')

# --------------------------------------
# Create and store summary statistics
TVsum    <- summary(adv$TV)
Salessum <- summary(adv$Sales)

outTV    <- capture.output(summary(adv$TV))
outSales <- capture.output(summary(adv$Sales))

cat("Outputs of TV and Sale Summaries, (respectively)", 
    "TV: ", outTV,
    " Sales: ", outSales,
    file="~/Desktop/stat159/hw2/stat159-fall2016-hw02/data/eda-output.txt", 
    sep="\n", 
    append=TRUE)
# -------------------------------------

# -------------------------------------
# Create and Save Histograms 

# Sales
qplot(adv$Sales,
      geom="histogram",
      binwidth = .75,  
      main = "Histogram for Sales", 
      fill=I("skyblue1"), 
      col=I("coral"), 
      alpha=I(.8)) + theme_wsj()

# Save png
dev.copy(png,"~/Desktop//stat159/hw2/stat159-fall2016-hw02/images/histogram-sales.png",
         width = 8, height = 6, units = "in", res = 100)
dev.off()
# Save pdf
pdf("~/Desktop//stat159/hw2/stat159-fall2016-hw02/images/histogram-sales.pdf",
    width = 8, heigh = 6)
qplot(adv$Sales,
      geom="histogram",
      binwidth = .75,  
      main = "Histogram for Sales", 
      fill=I("skyblue1"), 
      col=I("coral"), 
      alpha=I(.8)) + theme_wsj()
dev.off()

# TV


# Save png
dev.copy(png,"~/Desktop//stat159/hw2/stat159-fall2016-hw02/images/histogram-tv.png",
         width = 8, height = 6, units= "in", res = 100)
dev.off()
# Save pdf
pdf("~/Desktop//stat159/hw2/stat159-fall2016-hw02/images/histogram-tv.pdf",
    width = 8, height = 6)
qplot(adv$TV,
      geom="histogram",
      binwidth = 8,  
      main = "Histogram for TV",  
      fill=I("skyblue1"), 
      col=I("coral"), 
      alpha=I(.8)) + theme_wsj()
dev.off()
# ---------------------------------------------