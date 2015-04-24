#scopus search to doi list
list<-unlist(lapply(strsplit(unlist(regmatches(getURL(
"http://api.elsevier.com/content/search/scopus/?apiKey=___&query=%22chromeo+p503%22&field=doi&httpAccept=%20application%2Fatom%2Bxml&count=25&start=0"),
gregexpr("<prism:doi>[A-Za-z0-9.-/_:;\\(\\)]+</prism:doi>",
getURL("http://api.elsevier.com/content/search/scopus/?apiKey=___&query=%22chromeo+p503%22&field=doi&httpAccept=%20application%2Fatom%2Bxml&count=25&start=0")))),
"<|>"),function(x) x[3]))
#Avoids xml and xpath and parses using regular expressions on the text return.
#This script works for the first 25 returns. Can program a loop for changing the "start" string.
