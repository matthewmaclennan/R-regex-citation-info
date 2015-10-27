#Google Search
#How to obtain the total number of results from a Google search
mirex.gr<-htmlTreeParse(getURL("https://www.google.ca/search?q=mirex",
  ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T),useInternalNode=T)
xpathApply(mirex.gr,"//div[@id='resultStats']")

#Take a list of words from Word or other vector and convert to vector in R
listo<-c("
#Paste here the list from other program
#Then type the following:
")
listo<-gsub(" ","+",unlist(strsplit(listo,"\n")))

#loop it!
GoSear1<-function(LIST){
LISTY<-list()
for(i in 1:length(LIST)){
  LISTY[[i]]<-xpathApply(htmlTreeParse(getURL(paste0("https://www.google.ca/search?q=",LIST[i]),
    ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T),useInternalNode=T),"//div[@id='resultStats']")
  }
  LISTY
}

GoSearYear<-
