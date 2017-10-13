# Dynamic Content & JavaScript

When scraping, we are increasingly encountering pages whose
contents are not in static HTML downloaded from the server,
but which are dynamically generated within the user's Web browser.
This adds so much power and richness, but makes scraping so much harder.

In some cases, we are lucky and the data that we want is actually included
in the page or available separately as a separate download.
This might be as text in the HTML in the form of  JavaScript code or 
as a separate download of a JSON (JavaScript Object Notation) file.

In other cases, the content is determined only when the page is rendered and 
is updated based on user interactions and inputs.

There are 6 different scenarios for our purposes:
1. The page is static and defined entirely by the HTML sent by the server and is rendered by the
   browser statically.
1. The page is downloaded and the content dynamically generated when browser displays the page, but
the content is then fixed.
     1.  The data are in the HTML content for the page. 
	 1.  The data are retrieved separately from the HTML 
	 1.  The data are generated programmatically.
1. The content is updated and changed programmatically via user input.


1. For scenarios 1 - 3, we can scrape in the usual manner.
1. For scenario 4, we may want to find out how to get the data files that the 
Web page subsequently 


For 5 & 6, we need to run the JavaScript code and then get the resulting content.
This means we need a Web browser to do the job for us. But we want to do this
programmatically. To do this, we need to remote-control a Web browser.
Selenium is one such tool and the RSelenium package allows us to do this from R.

# Selenium and WebDriver




## Running the Server

There are many different ways to run the Selenium
server. The recommended way is via Docker.

Here is a way to run it locally on your own operating system
as a stand-alone application.
```
java -Dwebdriver.gecko.driver=`pwd`/geckodriver -Dwebdriver.chrome.driver=`pwd`/chromedriver -jar selenium-server-standalone-3.6.0.jar 
```

The `-D-Dwebdriver.gecko.driver=` part of the command tells the server where to 
find the executable needed to run the Gecko server. Similarly for the chrome server.
In our case, we have them in the same directory from which we are running the server.




## Installation

Download the geckodriver for Firefox at
    https://github.com/mozilla/geckodriver/releases/tag/v0.19.0

For Google Chrome, you can download the driver at 
  https://sites.google.com/a/chromium.org/chromedriver/downloads
  
There is an R package (wdman) and a node JS tool to help manage all of this for you.






