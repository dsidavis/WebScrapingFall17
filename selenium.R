library(RSelenium)

# Start the seleniumn server before we try to connecto to it.
# Then establish a connection to that browser instance.
remDr = remoteDriver(browserName = 'firefox')
remDr$open()

# Now have the browser visit the page of interest.
u = "https://www.aepenergy.com/"
remDr$navigate(u)


# We want to 
# change = remDr$findElement("id", "region__link--change")
zip = remDr$findElement("id", "region__input--zip")

zip$sendKeysToElement(list("45201\n"))
zip$clickElement()

enter = remDr$findElement("id", "region__link--enter")
enter$clickElement()

enroll = remDr$findElement("xpath", "//a[. = 'Enroll Now']")
enroll$clickElement()



txt = remDr$getPageSource()

library(XML)
doc = htmlParse(txt, asText = TRUE)


# Find the pattern by looking for a value we see and then going up the tree.
getNodeSet(doc, "//text()[contains(., '6.09')]/../..")[[1]]

# So <div class="offer-header">
getNodeSet(doc, "//div[@class = 'offer-header']")
# or if we just want the price
priceNodes = getNodeSet(doc, "//div[@class = 'price']/text()")
price = sapply(priceNodes, xmlValue, trim = TRUE)

price = price[price != ""]

# If we want the details of the plans, we could click, but the information is already in the document.

# Write the HTML text to a file and look at it. Or look for 'termination fee' and come back up the
# tree.
details = getNodeSet(doc, "//div[@class = 'more-details-container']")
length(details)

normalizeSpace =
function(x)
{
  gsub("[[:space:]]+", " ", x)
}

dataLine =
function(node)
{
    d = node[ names(node) == "div" ]
    val = normalizeSpace(xmlValue(d[[2]], trim = TRUE))
    title = normalizeSpace(xmlValue(d[[1]], trim = TRUE))
    structure(val, names = title)
}

xpathSApply(details[[1]], ".//div[contains(@class, 'data-line')]", dataLine)


#rD = rsDriver(browser = "phantomjs")
