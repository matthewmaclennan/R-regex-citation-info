#nature; URL contains search word at the end.
natureget<-function(URL){
list1<-list()
for(i in 1:20){
list1[[i]]<-strsplit(unlist(xpathApply(htmlTreeParse(getURL(paste0(URL,"&page=",i,collapse="")),useInternalNode=T),"//p",xmlValue))," \\| ",perl=T)

}
list1
}

#Extract dates
naturedatabasetitledates<-list()
for(i in 1:length(naturedatabasetitle)){
naturedatabasetitledates[[i]]<-matrix(unlist(lapply(naturedatabasetitle[[i]],function(x) x[length(x)==2])),ncol=2,byrow=T)
}
#plot & table of results
plot(table(sort(as.numeric(unlist(lapply(naturedatabasetitledates,function(x) strsplit(x[,2],"[0-9]{,2} \\w+ ")))))))
#
#
#
#science
sciencebigdatayears<-list()
for(i in 1:2){
test<-unlist(xpathApply(htmlTreeParse(getURL(paste0("http://www.sciencemag.org/search?site_area=sciencejournals&y=0&fulltext=%22big%20data%22&x=0&journalcode=sci&journalcode=sigtrans&journalcode=scitransmed&submit=yes&hits=100&FIRSTINDEX=",
(i-1),collapse="")),useInternalNode=T),"//span[@class='cit-print-date']",xmlValue))
sciencebigdatayears[[i]]<-as.numeric(unlist(regmatches(test,gregexpr("[0-9]+(?=:)",test,perl=T))))
}

sciencedatabasetitle<-list()
for(i in 1:3){
test<-unlist(xpathApply(htmlTreeParse(getURL(paste0("http://www.sciencemag.org/search?site_area=sciencejournals&y=0&title=database&x=0&journalcode=sci&journalcode=sigtrans&journalcode=scitransmed&submit=yes&hits=100&FIRSTINDEX=",
(i-1),collapse="")),useInternalNode=T),"//span[@class='cit-print-date']",xmlValue))
sciencedatabasetitle[[i]]<-as.numeric(unlist(regmatches(test,gregexpr("[0-9]+(?=:)",test,perl=T))))
}
