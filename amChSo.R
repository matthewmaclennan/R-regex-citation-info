#Finding DOIs in html
xpathApply(htmlTreeParse(getURL("http://pubs.acs.org/JACSbeta/jvi/issue31.html"),useInternalNode=T),"//div[@class='DOI']")
#accessing the page for articles DOI
#
#WOL html search for DOIs
regmatches(unlist(xpathApply(xmlTreeParse(getURL("http://onlinelibrary.wiley.com/advanced/search/results/reentry?scope=allContent&query=capillary+electrophoresis+acid&inTheLastList=6&queryStringEntered=false&searchRowCriteria[0].fieldName=all-fields&searchRowCriteria[0].booleanConnector=and&searchRowCriteria[1].fieldName=all-fields&searchRowCriteria[1].booleanConnector=and&searchRowCriteria[2].fieldName=all-fields&searchRowCriteria[2].booleanConnector=and"),
useInternalNode=T),"//@href")),
gregexpr("/doi/[A-Za-z0-9.-/\\(\\)]+[e?pdf|full|abstract|references]$",
unlist(xpathApply(xmlTreeParse(getURL("http://onlinelibrary.wiley.com/advanced/search/results/reentry?scope=allContent&query=capillary+electrophoresis+acid&inTheLastList=6&queryStringEntered=false&searchRowCriteria[0].fieldName=all-fields&searchRowCriteria[0].booleanConnector=and&searchRowCriteria[1].fieldName=all-fields&searchRowCriteria[1].booleanConnector=and&searchRowCriteria[2].fieldName=all-fields&searchRowCriteria[2].booleanConnector=and"),
useInternalNode=T),"//@href"))))
#creates list object
