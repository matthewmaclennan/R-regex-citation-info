#display links from Google scholar for citation information
#Need to place the arguments ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T at the end of the command
#in order to bypass the https.
getURL("https://scholar.google.ca/scholar?hl=en&q=%22capillary+electrophoresis%22+acid+%28fatty+OR+*oic+OR+naphthenic%29&btnG=&as_sdt=1%2C5&as_sdtp=",
ssl.verifyhost=F,ssl.verifypeer=F,followlocation=T)
