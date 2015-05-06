#display links from Google scholar for citation information
#Need to place the arguments ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T at the end of the command
#in order to bypass the https.
getURL("https://scholar.google.ca/scholar?hl=en&q=%22capillary+electrophoresis%22+acid+%28fatty+OR+*oic+OR+naphthenic%29&btnG=&as_sdt=1%2C5&as_sdtp=",
ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T)
#extract author and journal/repository information, where gs_a likely stands for "Google Scholar author"
#returns a list of likely 3 objects in a vector
strsplit(unlist(xpathApply(htmlTreeParse(gsc1,useInternalNode=T),"//*[@class='gs_a']",xmlValue))," - ")
#Extract article snippet
#The html is parsed, xpath all nodes named "div" (a lot) and regex for sentences containing specific keyword, ending in ellipsis
#returns character vector. The regex here is for "N-acylisourea" and its sentence.
unlist(regmatches(unlist(xpathApply(htmlTreeParse(results,useInternalNode=T),"//div",xmlValue)),
gregexpr(".+N-acylisourea.+\\.{3}",unlist(xpathApply(htmlTreeParse(results,useInternalNode=T),"//div",xmlValue)),perl=T)))
