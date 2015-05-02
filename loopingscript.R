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

#GScho equiv. (arbitrary numbers)
results<-c()
  for(i in 0:64){
    resultpage<-getURL(paste0("https://scholar.google.ca/scholar?start=",i*10,"&q=(%22N-acylisourea%22+OR+%22N-acylurea%22)+AND+EDC&hl=en&as_sdt=0,5"),
	ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T)

    results<-c(results,resultpage)
  }
results<-results
#Compile URLs from results into single vector
urls<-c()
for(i in 1:length(results)){
pageurls<-unlist(xpathApply(htmlTreeParse(results[[i]],useInternalNode=T),"//*[contains(@href,'http://')]",xmlGetAttr,name="href"))
urls<-c(urls,pageurls)
}
urls<-urls
#for an idea of duplicates
plot(table(urls))
#remove duplicates and URLs containing references to GoSch
unique(urls[-grep("scholar",urls)])
