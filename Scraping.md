# Scraping Web Pages

The entire purpose of this is automation.

Web Scraping (with one p, not two) is extracting content
from Web pages typically designed for humans to view.
The information is usually semi-structured, and we want to extract
it into structured data.

Because the pages are intended for humans, the layout is important, somewhat arbitrary and adds a
complex layer over the data we want.  The layout can be achieved in many different ways to create
the appearance. This makes it hard to find the information we want. Furthermore, it can readily
change as people change the appearance of the page(s) without changing the content!

Web scraping  involves finding patterns in the layout to identify the data we want.
This is not really useful if each page has the data in a different pattern and so we
have to write an extractor for each page.


# Web Services & APIs

Web APIs (Application Programming Interfaces) and Web Services
provide structured ways to get data that is not  intended
for humans to view in a browser. So we get back the data directly.

Web services use the Web to make requests and send the results back -
Request and Response.

We use HTTP(S) since it is so ubiquitous and it allows us to send
arbitrary data back and forth in the requests and responses (e.g.
text, images, video, ..., anything).

We use HTTP even to communicate between programs/applications on our own machine,
e.g. certain databases.

This is why it is so valuable to know how to make HTTP requests.


After one understands the ideas behind APIs,
they are much better than scraping data from HTML pages.
They are intended for programmatic extraction; HTML pages are not.

APIs also allow for authenticated access.


# Rules/Restrictions for Scraping

1. Most sites have Terms of Service (ToS) that
prohibit you from scraping data.
1. Most also will limit the number of requests you make.
1. Some will detect you are scraping and deny you access for
   a period, or forever.
1. You typically cannot scrape data and make it available to others.


Check the ToS before you do someting illegal.


# Other Alternatives

Before you start scraping, see if there are better, easier ways
to get the data.

1. See if it is available for bulk download rather than individual record-at-a-time requests.
1. Ask the owneres if they can give it to you.  (This will avoid burdening their servers.)
1. See if thre is an API for the data, and perhaps an existing package to access it.
1. Verify that the data are what you really want.
