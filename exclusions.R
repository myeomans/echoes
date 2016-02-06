echo<-read.csv("echoes1.csv", stringsAsFactors=F)
names(echo)
names(echo)[1:10]<-echo[1,1:10]
# extra title row
echo<-echo[2:nrow(echo),]
################################
# attention checks
################################

# 95 people missed the captcha
echo<-echo[(echo$Q81=="42"),]

# 41 people did not write enough about yesterday
echo$word.test<-word_count(echo$Q8)
plot(table(echo$word.test), xlim=c(0,100))
abline(v=24.5, lwd=2,col="red")
echo<-echo[!(echo$word.test<25),]

# 8 duplicated IPaddresses in the data
echo<-echo[!duplicated(echo$IPAddress),]

# N = 469 
dim(echo)