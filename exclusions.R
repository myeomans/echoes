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

# 8 duplicated IPaddresses
echo<-echo[!duplicated(echo$IPAddress),]

# 1 participant with incomplete data
echo<-(echo[!((echo$SB_den1=="")&(echo$SB_car1=="")),])

# N = 468
dim(echo)
