# XPath

XPath is designed to make working with HTML/XML trees
convenient. 
It is terse, powerful language for working with these trees.
It allows us to specify patterns for identifying nodes in trees.
It is analogous to regular expressions, but for trees.
(Some people use regular expressions for working with HTML/XML trees. Don't!)

XPath is a domain specific language (DSL) or sub-language that
is available in R, Python, etc. 
We specify our pattern/query within a string and R never looks at it.
Another engine applies it to the particular tree.


As the name suggests, an XPath pattern/query 
specifies a path. 
+ The path starts from a node (by default the topmost or root of the tree).
+ A path is a sequence of steps, separated by a /.

XPath queries are like navigating a file system, but much more expressive
and succinct.
 
Each step in an XPath query has 3 elements, with one being optional
+ axis/direction
+ node test (name or type)
+ condition/predicate

An XPath 

 Path - sequence of steps
 Each step:  direction/axis, node test, optional condition

 Long-hand
      axis::test[condition]
  e.g.
     descendant-or-self::table

  Short hand
       //table
      // means descendant-or-self

   @attr - attribute::attr
   
    . - current node
    .. - parent node

   All <td> nodes whose contents contain the character $
   //td[ contains(., '$') ]





# Useful References
+ https://www.w3schools.com/xml/xpath_intro.asp
+ https://www.w3schools.com/xml/xpath_axes.asp
