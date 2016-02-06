names(echo)[1:10]<-echo[1,1:10]
# extra title row
echo<-echo[2:nrow(echo),]


# Sensible names for probability estimate data
names(echo)[names(echo)%in%c("Q53_1")]<-"SB_car1"
names(echo)[names(echo)%in%c("Q52_1")]<-"SB_den1"
names(echo)[names(echo)%in%c("Q31_1")]<-"NH_win1"
names(echo)[names(echo)%in%c("Q48_1")]<-"NH_lose1"
names(echo)[names(echo)%in%c("Q54_1")]<-"SB_car2"
names(echo)[names(echo)%in%c("Q55_1")]<-"SB_den2"
names(echo)[names(echo)%in%c("Q57_1")]<-"NH_win2"
names(echo)[names(echo)%in%c("Q56_1")]<-"NH_lose2"

# Sensible quiz names
names(echo)[names(echo)%in%paste0("Q", 13:20)]<-c(paste0("QUIZ.text.nh",1:4),paste0("QUIZ.text.sb",1:4))