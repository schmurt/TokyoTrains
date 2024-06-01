#import the dataset I made from my GitHub
tokyo_stations <- read.csv("https://raw.githubusercontent.com/schmurt/TokyoTrains/main/tokyo_stations_dataset", stringsAsFactors = FALSE)

#Create a data visualization plotting all of the stations in Tokyo on a map

install.packages("leaflet") #map visualization
library("leaflet")

library("dplyr")

#select the names, latitude, and longitude of each station
station_locations = tokyo_stations %>% select('English.Station.Name','Japanese.Station.Name','Latitude', 'Longitude') 

leaflet(data = station_locations) %>% 
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = 139.45093, lat = 35.66471, zoom = 9) %>% #focus on Tokyo
  addCircles(
    lat = ~Latitude,
    lng = ~Longitude,
    popup = paste("English Name:", station_locations$English.Station.Name, "<br>",
                  "Japanese Name:", station_locations$Japanese.Station.Name),
    radius = 300,
    stroke = FALSE
  )

#Create a data visualization for the stations accessible through the Marunouchi Line

marunouchi_line <- tokyo_stations %>% filter(Marunouchi.Line == TRUE)
marunouchi_locations <- marunouchi_line %>% select('English.Station.Name', 'Japanese.Station.Name', 'Latitude', 'Longitude')

leaflet(data = marunouchi_locations) %>% 
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = 139.7, lat = 35.7, zoom = 11) %>% #focus on Marunouchi's range
  addCircles(
    lat = ~Latitude,
    lng = ~Longitude,
    popup = paste("English Name:", marunouchi_locations$English.Station.Name, "<br>",
                  "Japanese Name:", marunouchi_locations$Japanese.Station.Name),
    radius = 300,
    stroke = FALSE
  )

#Create a data visualization for the stations accessible through the Seibu-Seibuen Line
seibuen_line <- tokyo_stations %>% filter(Seibu.Seibuen.Line == TRUE)
seibuen_locations <- seibuen_line %>% select('English.Station.Name', 'Japanese.Station.Name', 'Latitude', 'Longitude')

leaflet(data = seibuen_locations) %>% 
  addProviderTiles("CartoDB.Positron") %>%
  setView(lng = 139.45, lat = 35.764, zoom = 12) %>% #focus on Seibuen
  addCircles(
    lat = ~Latitude,
    lng = ~Longitude,
    popup = paste("English Name:", seibuen_locations$English.Station.Name, "<br>",
                  "Japanese Name:", seibuen_locations$Japanese.Station.Name),
    radius = 300,
    stroke = FALSE
  )
