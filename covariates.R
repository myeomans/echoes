# Lots of work to do here

# 1 to 7 - "strong denver preference" to "strong carolina preference"
# 1 to 7 - "strong preference for trump loss" to "strong preference for trump win"
names(echo)[names(echo)%in%c("Q23_1","Q35_1")]<-paste0("preference.",c("nh","sb"))

# 1 to 5 c("democrat", "dem-independent", "independent", "gop-independent", "republican")
names(echo)[names(echo)%in%c("Q26_1")]<-"party.affiliation"

# 1 to 7 - "not at all" to "extremely" important
names(echo)[names(echo)%in%c("Q27_1","Q45_1")]<-paste0("importance.",c("nh","sb"))


# Still need to code up randomized orders
"DO.BR.FL_112"         
"DO.BR.FL_69"
"DO.BR.FL_107"
"DO.BR.FL_88"          
"DO.BR.FL_110"
"DO.BL.Importance"
"DO.Q.SB_choice"       
"DO.Q.NH_choice" 