#nature; URL contains search word at the end.
natureget<-function(URL){
list1<-list()
for(i in 1:56){
list1[[i]]<-strsplit(unlist(xpathApply(htmlTreeParse(getURL(paste0(URL,"&page=",i,collapse="")),useInternalNode=T),"//p",xmlValue))," \\| ",perl=T)

}
list1
}
