# Practical 4.R
# Finding Relationships in R
# https://data.cdrc.ac.uk/dataset/aa5491c9-cbac-4026-97c9-f9168462f4ac/resource/23a7f1e4-abdc-4375-8a75-d82b6bd936a2/download/practical4.html
# Created by Aja Manu on 20/05/17

# clear working environment
rm(list = ls())

# set working directory
setwd("C:/Users/amanu/Documents/R/Spatial Data Analysis")

# load library
library(ggplot2)
library(reshape2)

#### Load Data------------------------------------------------------------------
Census.Data <-read.csv("practicaldata.csv")

#### Bivariate correlations-----------------------------------------------------
# Runs a Pearson's correlation
cor(Census.Data$Unemployed, Census.Data$Qualification)

# Runs a Pearson's correlation
cor.test(Census.Data$Unemployed, Census.Data$Qualification)

# Note: Pearson’s correlation is only suitable when the relationship between the 
#two variables is linear. It is not sensitive to relationships that are non-linear. 
#In these circumstances, it is worth using Spearman’s rank correlation.

# Runs a Spearman's correlation
cor.test(Census.Data$Unemployed, Census.Data$Qualification, method="spearman")

# creates a data1 object which does not include the 1st column from the original data 
data1 <- Census.Data[,2:5]

# creates correlation matrix
cor(data1)

# creates correlation matrix
round(cor(data1),2)

# Regression analysis
qplot(x=Var1, y=Var2, data=melt(cor(data1, use="p")), fill=value, geom="tile") +
      scale_fill_gradient2(limits=c(-1, 1))

#### Regression analysis--------------------------------------------------------
model_1 <- lm(Census.Data$Qualification~ Census.Data$Unemployed)

plot(Census.Data$Unemployed, Census.Data$Qualification, xlab="% Unemployed",
     ylab="% With a Qualification") + abline (model_1)

summary(model_1)

confint(model_1, level= 0.95)

#### Mutliple regression--------------------------------------------------------
model_2 <- lm(Census.Data$Qualification~ Census.Data$Unemployed + 
                    Census.Data$White_British)

summary(model_2)
