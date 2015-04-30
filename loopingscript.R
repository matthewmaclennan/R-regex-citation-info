#Starting strings for accessing the entire URLs for various data repositories
#
#
#ScienceDirect results save
totalresults<-xpathApply(xmlTreeParse(getURL("api.elsevier.com/content/search/scidir?apiKey=ba0f6a67c909e5cd1e2dae428bb2b94d&query=TITLE-ABS-KEY%28capillary+electr*+derivati*%29&httpAccept=%20application%2Fxml&start=0&count=100")
,useInternalNode=T),"//opensearch:totalResults/text() div 1")
refreshes<-floor(totalresults/100)
results<-c()
  for(i in 0:refreshes*100){
    resultpage<-getURL(paste0("api.elsevier.com/content/search/scidir?apiKey=ba0f6a67c909e5cd1e2dae428bb2b94d&query=TITLE-ABS-KEY%28capillary+electr*+derivati*%29&httpAccept=%20application%2Fxml&start=",i,"&count=100"))

    results<-c(results,resultpage)
  }
results<-results
#
#WOL equivalent
#

#
