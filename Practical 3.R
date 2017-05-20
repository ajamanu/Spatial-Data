# Practical 3.R
# Bivariate Plots in R
# https://data.cdrc.ac.uk/dataset/aa5491c9-cbac-4026-97c9-f9168462f4ac/resource/91a687a0-f3bf-443c-8339-f82ee3a9815f/download/practical3.html
# Created by Aja Manu on 20/05/17

# clear working environment
rm(list = ls())

# set working directory
setwd("C:/Users/amanu/Documents/R/Spatial Data Analysis")

# load library


#### Load Data------------------------------------------------------------------
Census.Data <-read.csv("practicaldata.csv")

#### Scatter plots--------------------------------------------------------------
plot(Census.Data$Unemployed,Census.Data$Qualification)

# includes axis labels
plot(Census.Data$Unemployed,Census.Data$Qualification,xlab="% in full time employment",
     ylab="% With a Qualification")

#### Symbols plot---------------------------------------------------------------
# Create a proportional symbols plot
symbols(Census.Data$Unemployed,Census.Data$Qualification,  
        circles = Census.Data$White_British, fg="white", bg ="purple", inches = 0.3) 

# bubble plot
symbols(Census.Data$Unemployed, Census.Data$Qualification,  
        circles = Census.Data$White_British, fg="white", bg ="purple", inches = 0.2,  
        xlab="% in full time employment", ylab="% With a Qualification")
# adds a regression line, sets the colour to red
abline(lm(Census.Data$Qualification~ Census.Data$Unemployed), col="red")

# a bubble plot with a dotted regression line
symbols(Census.Data$Unemployed, Census.Data$Qualification,  
        circles = Census.Data$White_British, fg="white", bg ="purple", inches = 0.2,  
        xlab="% in full time employmented", ylab="% With a Qualification") + 
      abline(lm(Census.Data$Qualification~ Census.Data$Unemployed), col="red", 
             lwd=2, lty=2) 
