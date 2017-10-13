library(RCurl)
u = "https://www.cybercoders.com/search/"
# searchterms=Data+Scientist&searchlocation=&newsearch=true&originalsearch=true&sorttype="

txt = getForm(u, searchterms = "Data Scientist")

# Check we get the same as in the browser.

doc = htmlParse(txt)
w = getNodeSet(doc, "//div[@class = 'wage']")
sapply(w, xmlValue)


loc = xpathSApply(doc, "//div[@class = 'location']", xmlValue)

# Now we need to get the skills, but there will be more than one and a different number for each
# and we need to associate the set with a particular job, not just all individual skills
# So we work with each job listing and get the skills from that.

jobs = getNodeSet(doc, "//div[@class = 'job-listing-item']")
length(jobs)

# Why 21 of these, but 20 for the wage and location ?

lapply(jobs, function(j) xpathSApply(j, ".//li[@class = 'skill-item']/span[@class = 'skill-name']", xmlValue))



skills = lapply(jobs, function(j) xpathSApply(j, ".//li[@class = 'skill-item']//span[@class = 'skill-name']", xmlValue))




# What about the next page?

# <li> containing an <a> with an attribute rel with a value of  'next' and a class that contains next
nxt = getNodeSet(doc, "//li/a[@rel = 'next']/@href")

# Or
nxt = getNodeSet(doc, "//li/a[contains(@class, 'next')]/@href")

# We get 2 of these, but they are the same.

next.u = getRelativeURL(nxt[[1]], u)

txt = getURLContent(next.u)
doc = htmlParse(txt)

# And start all over again.
jobs = getNodeSet(doc, "//div[@class = 'job-listing-item']")
skills = c(skills, unlist(lapply(jobs, function(j) xpathSApply(j, ".//li[@class = 'skill-item']//span[@class = 'skill-name']", xmlValue))))

sort(table(unlist(skills)))



