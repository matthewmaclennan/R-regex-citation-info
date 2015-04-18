#
#&httpAccept=%20application%2Fatom%2Bxml can be appended to the URL to ensure that xml is returned. When using R, this is
#imperative to ensure that the package XML can be used to handle the output.
cefasd.xml<-xmlTreeParse(getURL(
"api.elsevier.com/content/search/scidir?apiKey=&query=capillary+electrophoresis+fatty+acid&httpAccept=%20application%2Fatom%2Bxml"))
