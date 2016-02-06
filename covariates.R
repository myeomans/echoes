
names(echo)[names(echo)%in%c("Q79_1")]<-"weight.confidence"
names(echo)[names(echo)%in%c("Q37")]<-"weight.estimate"

# Must check how these are coded in qualtrics
names(echo)[names(echo)%in%c("Q23_1","Q35_1")]<-paste0("preference.",c("nh","sb"))
names(echo)[names(echo)%in%c("Q26_1")]<-"party.affiliation"
names(echo)[names(echo)%in%c("Q27_1","Q45_1")]<-paste0("importance.",c("nh","sb"))


# Need to code up randomized orders
"DO.BR.FL_112"         
"DO.BR.FL_69"
"DO.BR.FL_107"
"DO.BR.FL_88"          
"DO.BR.FL_110"
"DO.BL.Importance"
"DO.Q.SB_choice"       
"DO.Q.NH_choice" 