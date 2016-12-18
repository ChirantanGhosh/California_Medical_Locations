library(readr)
library(stringr)
library(leaflet)
Health <- read_csv("C:\\Users\\Chirantan\\Desktop\\T\\Healthcare_Facility_Locations.csv")

ct <- Health[,c(3,25,26)]

summary(ct$LATITUDE)
summary(ct$LONGITUDE)

ct$LATITUDE[which(is.na(ct$LATITUDE))] <- 35.40
ct$LONGITUDE[which(is.na(ct$LONGITUDE))] <- -119.3


m <- leaflet(ct) #%>% #addTiles('http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png', 
m <- addTiles(m)                            #attribution='Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>') 
m %>% setView(-72.690940, 41.651426, zoom = 8)
m %>% addCircles(lng=ct$LONGITUDE, lat=ct$LATITUDE, popup=ct$FAC_TYPE_CODE, weight = 3, radius=40, 
                 color="red", stroke = TRUE, fillOpacity = 0.15) 

