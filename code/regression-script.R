# ------------ regression-script.R -----------------
# Reads in the Advertising.csv data set, and computes a "regression" object---
# via lm()---as well as the summary of such regression object---via summary(). 
# This script also produces the scatterplot with the regression line. The R objects from the 
# regression analysis are saved in the file regression.RData. In turn, the scatterplot is saved in 
# both PNG and PDF formats.

library(xtable)
library(tidyr)
library(tibble)
#setwd("/data/")
adv <- read.csv('data/Advertising.csv')


# Create lm object and save summary(lm)
lm.fit <- lm(Sales ~ TV, data=adv)
lmsum <- summary(lm.fit)
save(lmsum, file="data/regression.RData")





# Tables
reg <- lm(Sales ~ TV, data=adv)
reg_table <- xtable(reg)
print(reg_table, type = "latex", file = "reg-table.tex")


tbl2 <- xtable(glimpse(lmsum))
print(tbl2, type = "latex", file = "tbl2.tex")


# Create Scatterplot
plot(adv$TV, adv$Sales, pch=20, col='red', main="Linear Regression", xlab="TV", ylab="Sales")
abline(lm.fit, lwd=3, col='royalblue')
apply(cbind(adv$TV,adv$TV,adv$Sales,fitted(lm.fit)),1,function(coords){lines(coords[1:2],coords[3:4])})

# Save Scatterplots to png and pdf 
png("images/scatterplot-tv-sales.png")
plot(adv$TV, adv$Sales, pch=20, col='red', main="Linear Regression", xlab="TV", ylab="Sales")
abline(lm.fit, lwd=3, col='royalblue')
apply(cbind(adv$TV,adv$TV,adv$Sales,fitted(lm.fit)),1,function(coords){lines(coords[1:2],coords[3:4])})

dev.off()

pdf("images/scatterplot-tv-sales.pdf",width=8,height=6)
plot(adv$TV, adv$Sales, pch=20, col='red', main="Linear Regression", xlab="TV", ylab="Sales")
abline(lm.fit, lwd=3, col='royalblue')
apply(cbind(adv$TV,adv$TV,adv$Sales,fitted(lm.fit)),1,function(coords){lines(coords[1:2],coords[3:4])})
dev.off()