# HTTP
(This is intentionally simple, superficial.)

HTTP and HTTPS (secure HTTP) make the world go around these days.
HTTPS is just HTTP with secure, encrypted connections that
allow us to verify the site is who it says it is, and we are who we say we are,
and that "nobody" can eavesdrop.

HTTP is the Hyper Text Transfer Protocol.
It is a set of conventions for communicating,
specifically for one party (the client)
to ask a server for the contents or value
associated with a specific Web address, a URL (Uniform Resource Locator).


A Web browser is an HTTP client. R is an HTTP client. wget or curl are command-line 
HTTP clients. And so on.

After the initial connection, an HTTP transaction 
consists of a **Request** from the client 
and a **Response** from the server.  There can be a lot going on in these.

Both a request and a response consist of two parts - Header and Body.
The request may have an empty Body and overwhelming number of requests
in which we are interested for *scraping* have no body.

The header of a request or response provides information about 
the request and/or describes what is in the body, e.g.,
how many bytes are in the body, what is the format of the content (a JPEG, text, HTML).


An HTTP conversation might be just one request and response,
or it may be a sequence request-response interactions.


HTTP has 3 important verbs
+ GET
+ POST
+ PUT

Most HTTP requests are GET.
These have no body.

POST and PUT have a body and for our purposes are very, very similar.

When we make a request to a URL that has user-specific  inputs,
e.g., in a Web form, rather than just to a fixed URL, 
the request can include these inputs/parameters in various ways.

In the GET method, it appends the inputs to the end of the URL.
It separates these via the ? character. Each of the inputs
is separated from the others via a & and appears as name=value,
e.g.
```
https://www.rateinflation.com/consumer-price-index/usa-historical-cpi?start-year=2002&end-year=2017
```
The URL is 
`https://www.rateinflation.com/consumer-price-index/usa-historical-cpi`.
The two inputs are named
start-year and end-year and take values  2002 and 2017 in this request.



When we may want to send a lot of data as input to the request, we cannot it append it to the URL.
Instead, we use a POST (or PUT) request and these inputs are sent in the body of the request.  There
are three ways to include this information in the body - www-urlencoded-form, as
multipart/form-data, or directly.


Sending data in the body avoids having to escape binary data (e.g., images, video, saved R objects) 
to regular ASCII characters and then convert them back.


With RCurl (and hopefully other packages), all you need to know for an HTML
form is whether it expects a GET or POST request. This is in the method
