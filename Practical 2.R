# Practical 2.R
# Data exploration in R
# https://data.cdrc.ac.uk/dataset/aa5491c9-cbac-4026-97c9-f9168462f4ac/resource/1ced23f6-f5b2-4727-bb64-931842a121a0/download/practical2.html
# Created by Aja Manu on 20/05/17

# clear working environment
rm(list = ls())

# set working directory
setwd("C:/Users/amanu/Documents/R/Spatial Data Analysis")

# load library
library(vioplot)

#### Load Data------------------------------------------------------------------
Census.Data <-read.csv("practicaldata.csv")

#### Exploring the data---------------------------------------------------------
# prints the selected data within the console
print(Census.Data[1:20,1:5])

#Get the number of columns
ncol(Census.Data)

#Get the number of rows
nrow(Census.Data)

#List the column headings
names(Census.Data)

#### Descriptive statistics-----------------------------------------------------
#mean, median, 25th and 75th quartiles, min, max 
summary(Census.Data)

#### Univariate plots-----------------------------------------------------------
# Creates a histogram
hist(Census.Data$Unemployed)

# Creates a histogram, enters more commands about the visualisation
hist(Census.Data$Unemployed, breaks=50, col= "blue", 
     main="% in full-time employment", xlab="Percentage")

# box and whisker plots
boxplot(Census.Data[,2:5])

# creates a violin plot for 4 variables, uses 3 shades of blue
vioplot(Census.Data$Unemployed, Census.Data$Qualification, Census.Data$White_British, 
        Census.Data$Low_Occupancy, ylim=c(0,100), col = "dodgerblue", 
        rectCol="dodgerblue3", colMed="dodgerblue4")

# add names to the plot
vioplot(Census.Data$Unemployed, Census.Data$Qualification, Census.Data$White_British, 
        Census.Data$Low_Occupancy, ylim=c(0,100), col = "dodgerblue", 
        rectCol="dodgerblue3", colMed="dodgerblue4", 
        names=c("Unemployed", "Qualifications", "White British", "Occupancy"))
