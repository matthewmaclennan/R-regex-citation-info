#display links from Google scholar for citation information
#Need to place the arguments ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T at the end of the command
#in order to bypass the https.
getURL("https://scholar.google.ca/scholar?hl=en&q=%22capillary+electrophoresis%22+acid+%28fatty+OR+*oic+OR+naphthenic%29&btnG=&as_sdt=1%2C5&as_sdtp=",
ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T)
#If getURL does not work, then load the httr package
library(httr)
#Use GET() and content() to read the text.
gsc1<-content(GET("http://scholar.google.ca/scholar?q=%22taylor dispersion%22 protein&as_ylo=1996&as_yhi=2016&num=20",
ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T))
#extract author and journal/repository information, where gs_a likely stands for "Google Scholar author"
#returns a list of likely 3 objects in a vector
strsplit(unlist(xpathApply(gsc1,"//*[@class='gs_a']",xmlValue))," - ")
#Extract article snippet
#The html is parsed, xpath all nodes named "div" (a lot) and regex for sentences containing specific keyword, ending in ellipsis
#returns character vector. The regex here is for "N-acylisourea" and its sentence.
unlist(regmatches(unlist(xpathApply(htmlTreeParse(results,useInternalNode=T),"//div",xmlValue)),
gregexpr(".+N-acylisourea.+\\.{3}",unlist(xpathApply(htmlTreeParse(results,useInternalNode=T),"//div",xmlValue)),perl=T)))


#Dec 02, 2015 this works.
xpathApply(content(GET("http://scholar.google.ca/scholar?q=%22knowledge+mobilization%22",ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T)),"//div[@id='gs_ab_md']")

listy<-list()
for(i in 1:96){
listy[[i]]<-GET(paste0("http://scholar.google.ca/scholar?q=%22knowledge+mobilization%22","&start=",i*10),ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T)
}
