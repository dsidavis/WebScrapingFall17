library(RCurl)
u = "https://www.nrghomepower.com/plans/oh/#close"
    tt = getURLContent(u)

class(tt)
nchar(tt)

library(XML)
doc = htmlParse(tt)


I suspect that while the contents we want do not appear on the Web page,
they are in the actual content of the HTML document.


In the "Select Electric Utility",
we can select Ohio Power Company or Duke Energy Ohio.

If we select the first, we see a variety of different plans with 6.40c per kWh etc.


If we display the entire HTML document in R (or look at it in the Web browser),
we see some JavaScript near the bottom and in it

......
{"rate_cents": "7.90&cent;", "eligible_zipcode_required": false, "terms_of_service": "/proxy/api/tos/9DF10CAF-69EF/", "disclosure": "/proxy/api/disclosure/9DF10CAF-69EF/", "sku": "9DF10CAF-69EF", "utility": {"slug": "te", "commodity": "electric", "rate_unit": "kWh", "name": "Toledo Edison"}}], "term": {"duration_months": "6", "term_type": "fixed", "description": "6 months fixed"}, "green_text": "100% Wind"}]};</script><script src="/static/nrghomepower/js/compiled/plans.js"></script><script type="text/javascript">


That looks like some of the data we want.

This is in a <script> node.
Let's get those

sc = getNodeSet(doc, "//script")
length(sc)

So there are 15 of them.
Let's find those that contain the word rate_cents

sc = getNodeSet(doc, "//script[contains(., 'rate_cents')]")

length(sc)

So we got the one we wanted.

Let's look at the start of the contents of this node

js = xmlValue(sc[[1]])
substring(js, 1, 300)

[1] "var plans = {\"utilities\": [{\"slug\": \"aepn\", \"commodity\": \"electric\", \"rate_unit\": \"kWh\", \"name\": \"Ohio Power Company (AEP)\"}, {\"slug\": \"dukeoh\", \"commodity\": \"electric\", \"rate_unit\": \"kWh\", \"name\": \"Duke Energy Ohio\"}, {\"slug\": \"te\", \"commodity\": \"electric\", \"rate_unit\": \"kWh\", \"name\": \"Toledo Ediso"


We see the JavaScript code to create a variable named plans, i.e.  var plans =
 Then we have the value for this variable.
The text after the = is JavaScript code, but importantly is in JSON - JavaScript Object Notation - format.

R and many other languages have support for reading JSON.
So let's remove the 'var plans =' and also the ; at the end of the JavaScript code

js = gsub("^var plans =", "", js)
js = gsub(";$", "", js)

Now we can read this into R as a list
library(RJSONIO)
d = fromJSON(js, asText = TRUE)


class(d)
names(d)

str(d$utilities)

d$utilities[[1]]
                      slug                  commodity 
                    "aepn"                 "electric" 
                 rate_unit                       name 
                     "kWh" "Ohio Power Company (AEP)"


do.call(rbind, d$utilities)

     slug     commodity  rate_unit name                      
[1,] "aepn"   "electric" "kWh"     "Ohio Power Company (AEP)"
[2,] "dukeoh" "electric" "kWh"     "Duke Energy Ohio"        
[3,] "te"     "electric" "kWh"     "Toledo Edison"
[4,] "dpl"    "electric" "kWh"     "Dayton Power & Light"    


What about the products?

str(d$products)

d$products[[1]]

Let's get the rate_cents which is in the element named "rates"

sapply(d$products[[1]]$rates, `[[`, "rate_cents")

[1] "7.50&cent;" "7.20&cent;"

We can get rid of the $cent; with gsub()

Is this the same across the elements of products?


lapply(d$products , function(p) sapply(p$rates, `[[`, "rate_cents"))

If we need additional data about these rates, we can extract that at the same time.


    
