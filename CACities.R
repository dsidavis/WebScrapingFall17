library(XML)
u = "http://www.city-data.com/city/California.html"

# We want the links to all of the cities listed in the table on this page
# We get all the links
ll = getHTMLLinks(u)

# Look at them
head(ll)

# Look at the one for Acton, the first city in the table
grep("Acton", ll, value = TRUE)
#"Acton-California.html"

# So we want the ones that start with a letter and end with -California.html

cll = grep("-California.html$", ll, value = TRUE)

tgt = getRelativeURL(cll, u)


# Read the table

tb = readHTMLTable(u, stringsAsFactors = FALSE)
length(tb)
sapply(tb, nrow)

tb$cityTAB




# Let's get the links that are in the  table of cities.
doc = htmlParse(u)
getNodeSet(doc, "//table[@id = 'cityTAB']//a/@href")
