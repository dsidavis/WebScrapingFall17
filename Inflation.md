
```
library(RCurl)
tt = getURLContent("https://www.rateinflation.com/consumer-price-index/usa-historical-cpi?form=usacpi")
```

```
library(XML)
doc = htmlParse(tt)
tbl = readHTMLTable(doc)
length(tbl)
[1] 1
dim(tbl[[1]])
[1] 12 14
```

```
tbl[[1]]
     V1      V2      V3      V4      V5      V6      V7      V8
1  Year     jan     feb     mar     apr     may     jun     jul
2  2017 242.839 243.603 243.801 244.524 244.733 244.955 244.786
3  2016 236.916 237.111 238.132 239.261 240.236 241.038 240.647
4  2015 233.707 234.722 236.119 236.599 237.805 238.638 238.654
5  2014 233.916 234.781 236.293 237.072   237.9 238.343  238.25
6  2013  230.28 232.166 232.773 232.531 232.945 233.504 233.596
7  2012 226.665 227.663 229.392 230.085 229.815 229.478 229.104
8  2011 220.223 221.309 223.467 224.906 225.964 225.722 225.922
9  2010 216.687 216.741 217.631 218.009 218.178 217.965 218.011
10 2009 211.143 212.193 212.709  213.24 213.856 215.693 215.351
11 2008  211.08 211.693 213.528 214.823 216.632 218.815 219.964
12 2007 202.416 203.499 205.352 206.686 207.949 208.352 208.299
        V9     V10     V11     V12     V13     V14
1      aug     sep     oct     nov     dec     ann
2  245.519                                        
3  240.849 241.428 241.729 241.353 241.432 240.011
4  238.316 237.945 237.838 237.336 236.525 237.017
5  237.852 238.031 237.433 236.151 234.812 236.736
6  233.877 234.149 233.546 233.069 233.049 232.957
7  230.379 231.407 231.317 230.221 229.601 229.594
8  226.545 226.889 226.421  226.23 225.672 224.939
9  218.312 218.439 218.711 218.803 219.179 218.055
10 215.834 215.969 216.177  216.33 215.949 214.537
11 219.086 218.783 216.573 212.425 210.228 215.303
12 207.917  208.49 208.936 210.177 210.036 207.342
```
The column names (Year, jan, feb, ...) are in the first row and we have generic column names
V1, V2, ...
So we tell `readHTMLTable()` the table has a header line.
```
tbl = readHTMLTable(doc, header = TRUE)
tbl[[1]]
   Year     jan     feb     mar     apr     may     jun     jul
1  2017 242.839 243.603 243.801 244.524 244.733 244.955 244.786
2  2016 236.916 237.111 238.132 239.261 240.236 241.038 240.647
3  2015 233.707 234.722 236.119 236.599 237.805 238.638 238.654
4  2014 233.916 234.781 236.293 237.072   237.9 238.343  238.25
5  2013  230.28 232.166 232.773 232.531 232.945 233.504 233.596
6  2012 226.665 227.663 229.392 230.085 229.815 229.478 229.104
7  2011 220.223 221.309 223.467 224.906 225.964 225.722 225.922
8  2010 216.687 216.741 217.631 218.009 218.178 217.965 218.011
9  2009 211.143 212.193 212.709  213.24 213.856 215.693 215.351
10 2008  211.08 211.693 213.528 214.823 216.632 218.815 219.964
11 2007 202.416 203.499 205.352 206.686 207.949 208.352 208.299
       aug     sep     oct     nov     dec     ann
1  245.519                                        
2  240.849 241.428 241.729 241.353 241.432 240.011
3  238.316 237.945 237.838 237.336 236.525 237.017
4  237.852 238.031 237.433 236.151 234.812 236.736
5  233.877 234.149 233.546 233.069 233.049 232.957
6  230.379 231.407 231.317 230.221 229.601 229.594
7  226.545 226.889 226.421  226.23 225.672 224.939
8  218.312 218.439 218.711 218.803 219.179 218.055
9  215.834 215.969 216.177  216.33 215.949 214.537
10 219.086 218.783 216.573 212.425 210.228 215.303
11 207.917  208.49 208.936 210.177 210.036 207.342
```

Often `readHTMLTable()` will be able to identify the header itself,
if the HTML is "properly" structured (with a thead and tbody component).


Often the page will have multiple tables and we only want one.
We can use the `which` parameter to specify either the table's number or name (within the
HTML document via its `id` attribute).
```
readHTMLTable(doc, which = 1)
```






# Historical Data - HTML Forms

Let's chose a different year and click "Get Historical CPI Data"
In the navigation bar, we see the URL
```
https://www.rateinflation.com/consumer-price-index/usa-historical-cpi?start-year=2002&end-year=2017
```
We see the start-year and end-year.
This is how we pass the user-specified inputs: separated from the URL via the ?
and then in name=value pairs separated by a &

In R, we don't need to do this string manipulation,
```
u = "https://www.rateinflation.com/consumer-price-index/usa-historical-cpi"
tt = getForm(u, 'start-year' = 1930, 'end-year' = 2017)
doc = htmlParse(tt, asText = TRUE)
tbl = readHTMLTable(doc, which = 1, stringsAsFactors = FALSE, header = TRUE)
```

```
head(tbl)
```


