#!/bin/bash
time curl https://www1.nyc.gov/html/dot/downloads/ParkReg/Parking_Regulation_Shapefile.zip  -L -o  nyc_signs.zip
time unzip -n nyc_signs.zip
time rm nyc_signs.zip
time ogr2ogr -f "GeoJSON" rawSigns.json ./Parking_Regulation_Shapefile/Parking_Regulation_Shapefile.shp 
time rm -rf Parking_Regulation_Shapefile 

time jq '{
  "type": "FeatureCollection",
  "features": [
    .features[] | select(.properties.SIGNDESC | contains("(SANITATION BROOM SYMBOL)")) | {
      "type": "Feature",
      "geometry": .geometry,
      "properties": {
        "SIGNDESC": .properties.SIGNDESC,
        "SG_KEY_BOR": .properties.SG_KEY_BOR
      }
    }
  ]
}' rawSigns.json > justBrooms.geojson
sh ../cleanSigns.sh

# time rm -rf justBrooms.geojson rawSigns.json 
