#Google Search
#How to obtain the total number of results from a Google search
mirex.gr<-htmlTreeParse(getURL("https://www.google.ca/search?q=mirex",
  ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T),useInternalNode=T)
xpathApply(mirex.gr,"//div[@id='resultStats']")
#result number as numeric object.
as.numeric(gsub(",","",unlist(regmatches(unlist(xpathApply(mirex.gr,"//div[@id='resultStats']",xmlValue)),gregexpr("[0-9,]+",unlist(xpathApply(mirex.gr,"//div[@id='resultStats']",xmlValue)))))))
#General commands
#total results "//div[@id='resultStats']"
#Date of each entry xpathApply(bob[[1]],"//span[@class='f']")
#Entry summary xpathApply(bob[[1]],"//span[@class='st']",xmlValue)
#Entry URL xpathApply(bob[[1]],"//h3[@class='r']/a",xmlAttrs) and this must be prefixed with www.google.com

#Take a list of words from Word or other vector and convert to vector in R
listo<-c("
#Paste here the list from other program
#Then type the following:
")
listo<-gsub(" ","+",unlist(strsplit(listo,"\n")))

#loop it!

GoSear<-function(LIST){
LISTY<-list()
for(i in 1:length(LIST)){
  LISTY[[i]]<-htmlTreeParse(getURL(paste0("https://www.google.ca/search?q=",LIST[i]),
    ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T),useInternalNode=T)
  }
  LISTY
}

GoSear1<-function(LIST){
LISTY<-list()
for(i in 1:length(LIST)){
  LISTY[[i]]<-xpathApply(htmlTreeParse(getURL(paste0("https://www.google.ca/search?q=",LIST[i]),
    ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T),useInternalNode=T),"//div[@id='resultStats']")
  }
  LISTY
}

GoSear12<-function(LIST){
LISTY<-c()
for(i in 1:length(LIST)){
  NUMB<-xpathApply(htmlTreeParse(getURL(paste0("https://www.google.ca/search?q=",LIST[i]),
    ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T),useInternalNode=T),"//div[@id='resultStats']",xmlValue)
  LISTY<-c(LISTY,as.numeric(gsub(",","",unlist(regmatches(unlist(NUMB),gregexpr("[0-9,]+",unlist(NUMB)))))))
  }
  LISTY
}

GoSearYear<-
