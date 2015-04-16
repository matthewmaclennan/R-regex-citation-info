#Scripts for using regular expressions to search through
#citation data from papers. 
#
#Below is the script for finding the term "fatty acids" (variable case) in the text file "cefasd", including two words to the 
#left and two words to the right. The strings are returned and the location of those strings is used to extract the doi,
#which also resides in the same string (by structure of "cefasd").
 unlist(regmatches(cefasd[unlist(gregexpr("[A-Za-z]+ [A-Za-z]+ [Ff]atty [Aa]cid [A-Za-z]+ [A-Za-z]+",cefasd))>0],
	gregexpr("https?://dx.doi.org/[A-Za-z0-9./]+",
	cefasd[unlist(gregexpr("[A-Za-z]+ [A-Za-z]+ [Ff]atty [Aa]cid [A-Za-z]+ [A-Za-z]+",cefasd))>0])))
