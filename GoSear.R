#Google Search
#How to obtain the total number of results from a Google search
mirex.gr<-htmlTreeParse(getURL("https://www.google.ca/search?q=mirex",
  ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T),useInternalNode=T)
xpathApply(mirex.gr,"//div[@id='resultStats']")
