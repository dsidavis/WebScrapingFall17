# HTML & XML

An HTML or XML document is a tree of nodes.
```
<html>
<head>
<title>Overview of HTML and XML</title>
</head>
<body>
<h1>HTML</h1>
<p>
<b><a href="http://...">HTML</a></b> is a markup language ...
</p>
</body>
</html>
```

Each node
+ has a name
+ has a start and end consisting of the `<name>` and `</name>`
+ a node can have sub- or child-nodes,
```
 <p>
   <b>
     <a href="http://...">
	   HTML
     </a>
   </b> 
   is a 
   <i>markup</i>
   language ...
 </p>
```
+ the start of a node can have zero or more attributes of the form name="value"


HTML documents typically have 
CSS (Cascading StyleSheet) documents
that they reference. These help to control the appearance of the elements.

HTML documents can include JavaScript code (directly or by reference)
and the JavaScript code can provide dynamic, interactive content to the
page.

