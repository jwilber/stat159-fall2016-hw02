# ------------ regression-script.R -----------------
# Reads in the Advertising.csv data set, and computes a "regression" object---
# via lm()---as well as the summary of such regression object---via summary(). 
# This script also produces the scatterplot with the regression line. The R objects from the 
# regression analysis are saved in the file regression.RData. In turn, the scatterplot is saved in 
# both PNG and PDF formats.


setwd("~/Desktop/stat159/hw2/stat159-fall2016-hw02/data/")
adv <- read.csv('Advertising.csv')


# Create lm object and save summary(lm)
lm.fit <- lm(Sales ~ TV, data=adv)
lmsum <- summary(lm.fit)
save(lmsum, file="~/Desktop/stat159/hw2/stat159-fall2016-hw02/data/regression.RData")

# Create Scatterplot
plot(adv$TV, adv$Sales, pch=20, col='red', main="Linear Regression", xlab="TV", ylab="Sales")
abline(lm.fit, lwd=3, col='royalblue')
apply(cbind(adv$TV,adv$TV,adv$Sales,fitted(lm.fit)),1,function(coords){lines(coords[1:2],coords[3:4])})

# Save Scatterplots to png and pdf (pdf not working)
dev.copy(png,"~/Desktop//stat159/hw2/stat159-fall2016-hw02/images/scatterplot-tv-sales.png",width=8,height=6,units="in",res=100)
dev.off()
pdf("~/Desktop//stat159/hw2/stat159-fall2016-hw02/images/scatterplot-tv-sales.pdf",width=8,height=6)
dev.off()