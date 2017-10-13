
ereadHTMLTable = 
function(tbl)
{
    h = tbl[["tr"]]
    headerIDs = xmlSApply(h, xmlGetAttr, "id")
    colNames = xmlSApply(h, xmlValue)

    

}
