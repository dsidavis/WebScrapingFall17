
library(XML)

u = "http://www.city-data.com/city/Acton-California.html"

doc = htmlParse(u)

r = getNodeSet(doc, "//text()[contains(., 'gross rent')]/..")

p = xmlParent(r[[1]])
val = xmlChildren(p)
xmlValue(val)

# OR
r = getNodeSet(doc, "//b[contains(., 'gross rent')]/following-sibling::text()")
xmlValue(r[[1]])




