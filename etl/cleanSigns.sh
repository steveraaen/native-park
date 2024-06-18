time jq '
  .features[] |= (
    .properties.SIGNDESC |= gsub(" SINGLE ARROW\\s|NO PARKING\\s*|MOON & STARS\\s{1,}|NIGHT REGULATION\\s*?"; "") |
    .properties.SIGNDESC |= gsub("<?-{1,}>"; "") |
    .properties.SIGNDESC |= gsub("\\([^)]*\\)"; "") |
    .properties.SIGNDESC |= gsub("^\\s{1,}|\\s{1,}$"; "") |
    .properties.SIGNDESC |= gsub("\\s?W/?\\s*SINGLE ARROW"; "") |
    .properties.SIGNDESC |= gsub("\\s*SUPER?SEDE.*|SEE.*|DATED.*|\\s*USE PS.*|W\\/\\s*"; "") |
    .properties.SIGNDESC |= gsub("EXCEPT\\s(SUNDAY|SUN)"; "MON TUE WED THU FRI SAT") |
    .properties.SIGNDESC |= gsub("12AM|MIDNIGHT";"12:00AM") | 
    .properties.SIGNDESC |= gsub("1AM|1-";"1:00AM") | 
    .properties.SIGNDESC |= gsub("2AM|2-";"2:00AM") | 
    .properties.SIGNDESC |= gsub("3AM|3-";"3:00AM") | 
    .properties.SIGNDESC |= gsub("4AM|4-";"4:00AM") | 
    .properties.SIGNDESC |= gsub("5AM|5-";"5:00AM") | 
    .properties.SIGNDESC |= gsub("6AM|6-";"6:00AM") | 
    .properties.SIGNDESC |= gsub("7AM|7-";"7:00AM") | 
    .properties.SIGNDESC |= gsub("8AM|8-";"8:00AM") | 
    .properties.SIGNDESC |= gsub("9AM|9-";"9:00AM") | 
    .properties.SIGNDESC |= gsub("10AM|10-";"10:00AM") | 
    .properties.SIGNDESC |= gsub("11AM|11-";"11:00AM") | 
    .properties.SIGNDESC |= gsub("NOON";"12:00PM") | 
    .properties.SIGNDESC |= gsub("1PM";"1:00PM") | 
    .properties.SIGNDESC |= gsub("2PM";"2:00PM") | 
    .properties.SIGNDESC |= gsub("3PM";"3:00PM") | 
    .properties.SIGNDESC |= gsub("MONDAY|MODAY";"MON") |
    .properties.SIGNDESC |= gsub("TUESDAY|TUES";"TUE") |
    .properties.SIGNDESC |= gsub("WEDNESDAY|WEDN";"WED") |
    .properties.SIGNDESC |= gsub("THURSDAY|THUR|THURS|THUS|RSDAY";"THU") |
    .properties.SIGNDESC |= gsub("THUS";"THU") |
    .properties.SIGNDESC |= gsub("FRIDAY";"FRI") |
    .properties.SIGNDESC |= gsub("SATURDAY";"SAT") |
    .properties.SIGNDESC |= gsub("SUNDAY";"SUN") |
    .properties.SIGNDESC |= gsub("\\sTO\\s";"-") |
    .properties.SIGNDESC |= gsub("\\sTO-";"-") |
    .properties.SIGNDESC |= gsub("\\s\\&\\s";" ") |
    .properties.SIGNDESC |= gsub("(?<a>M)(?<b>[1-9])";.a+"-"+.b) |
    .properties.SIGNDESC |= gsub("AMPM";"PM") |
    .properties.SIGNDESC |= gsub("1\\sPM ";"1:00PM") 
  )
' justBrooms.geojson > modifiedBrooms.json
rm -rf rawSigns.json justBrooms.geojson
python3 makedb.py
