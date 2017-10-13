library(RCurl)
library(RJSONIO)

# Documentation
#  https://developer.nrel.gov/docs/electricity/census-rate-v3/

# We control whether we get XML or JSON back via the suffix of the URL
# e.g.  http://.../v3.xml or http://.../v3.xml

u = "https://developer.nrel.gov/api/census_rate/v3.json"
txt = getForm(u, lat = 38.539, lon = -121.749, api_key = NRELKey)

cat(txt)

ans = fromJSON(txt)

# By address
txt = getForm(u, id = 06001,  address = "Shields Library, Davis, CA", api_key = NRELKey)
fromJSON(txt)


# Schiller Park Longitude in Illinois
txt = getForm(u, lat = 41.95, lon = -87.87, api_key = NRELKey)
fromJSON(txt)


