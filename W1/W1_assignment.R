# Libraries
library(tidyverse)
library(googlesheets4)
library(leaflet)

# Read coordinates and features into dataframe
places <- read_csv("data/RCFeature.csv") %>% na.omit()
glimpse(places)

# Create map with points
blue_mountain <-leaflet() %>% 
  addTiles() %>% addMiniMap() %>% addMeasure() %>% 
  addMarkers(lng = places$Longitude, 
             lat = places$Latitude,
             popup = paste(
               "ID:", places$FeatureID, "<br>",
               "Type:", places$FeatureType, "<br>",
               "Description:", places$Description, "<br>"),
             clusterOptions = markerClusterOptions())

# Save map as a html document
library(htmlwidgets)
saveWidget(blue_mountain, "blue_mountain.html", selfcontained = TRUE)
