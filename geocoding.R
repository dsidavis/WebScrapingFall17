library(RCurl)
library(RJSONIO)

u = "https://maps.googleapis.com/maps/api/geocode/json"

ans = getForm(u, address = "Shields Library, Davis",  key = GoogleGeocodeKey)

cat(ans)
g = fromJSON(ans)
str(g)

g$results[[1]]$geometry$location

g$results[[1]]$formatted_address

