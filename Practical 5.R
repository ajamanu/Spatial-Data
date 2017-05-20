# Practical 5.R
# Making maps in R
# https://data.cdrc.ac.uk/dataset/aa5491c9-cbac-4026-97c9-f9168462f4ac/resource/23a7f1e4-abdc-4375-8a75-d82b6bd936a2/download/practical4.html
# Created by Aja Manu on 20/05/17

# clear working environment
rm(list = ls())

# set working directory
setwd("C:/Users/amanu/Documents/R/Spatial Data Analysis")

# load library
library(ggplot2)
library(rgdal)
library(rgeos)
library(tmap)
library(leaflet)
library(RColorBrewer)

#### Load data------------------------------------------------------------------
# Load the data. You may need to alter the file directory
Census.Data <-read.csv("practicaldata.csv")


#### Loading shapefiles---------------------------------------------------------
# Load the output area shapefiles
Output.Areas<- readOGR(".", "Camden_oa11")

# plots the shapefile
plot(Output.Areas)

#### Joining data---------------------------------------------------------------
# joins data to the shapefile
OA.Census <- merge(Output.Areas, Census.Data, by.x="OA11CD", by.y="OA")

#### Setting a coordinate system------------------------------------------------
# sets the coordinate system to the British National Grid
proj4string(OA.Census) <- CRS("+init=EPSG:27700")

#### Mapping data---------------------------------------------------------------

## Creating a quick map
# this will prodyce a quick map of our qualification variable
qtm(OA.Census, fill = "Qualification")

## Creating more advanced maps with tmap
# Creates a simple choropleth map of our qualification variable
tm_shape(OA.Census) + tm_fill("Qualification") 

# setting a colour palette
tm_shape(OA.Census) + tm_fill("Qualification", palette = "-Greens") 

# changing the intervals 
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", palette = "Reds")
 
tm_shape(OA.Census) + tm_fill("Qualification", style = "pretty", palette = "Reds")

tm_shape(OA.Census) + tm_fill("Qualification", style = "jenks", palette = "Reds")

# number of levels
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", n = 7, 
                              palette = "Reds") 

# includes a histogram in the legend
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", n = 5, 
                              palette = "Reds", legend.hist = TRUE) 

## Adding borders
# add borders
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds") + 
      tm_borders(alpha=.4)

## Adding a north arrow
# north arrow
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds") + 
      tm_borders(alpha=.4) +
      tm_compass()

## Editing the layout of the map
# adds in layout, gets rid of frame
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds", style = "quantile", 
                              title = "% with a Qualification") + 
      tm_borders(alpha=.4) + 
      tm_compass() + 
      tm_layout(title = "Camden, London", legend.text.size = 1.1, 
                legend.title.size = 1.4, legend.position = c("right", "top"), frame = FALSE) 

## Saving the shapefile
writeOGR(OA.Census, dsn = "C:/Users/amanu/Documents/R/Spatial Data Analysis", 
         layer =  "Census_OA_Shapefile", driver="ESRI Shapefile")