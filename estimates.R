echo$NH_cx_name<-c("win","lose")[as.numeric(echo$NH_choice)]
echo$SB_cx_name<-c("car","den")[as.numeric(echo$SB_choice)]

# Renaming probability estimates
names(echo)[names(echo)%in%c("Q53_1")]<-"SB_car1"
names(echo)[names(echo)%in%c("Q52_1")]<-"SB_den1"
names(echo)[names(echo)%in%c("Q31_1")]<-"NH_win1"
names(echo)[names(echo)%in%c("Q48_1")]<-"NH_lose1"
names(echo)[names(echo)%in%c("Q54_1")]<-"SB_car2"
names(echo)[names(echo)%in%c("Q55_1")]<-"SB_den2"
names(echo)[names(echo)%in%c("Q57_1")]<-"NH_win2"
names(echo)[names(echo)%in%c("Q56_1")]<-"NH_lose2"

flip.DEN <-(echo$SB_cx_name=="den")
flip.LOSE<-(echo$NH_cx_name=="lose")

echo$SB_favorite1<-echo$CARvDEN1<-as.numeric(echo$SB_car1)
echo$SB_favorite2<-echo$CARvDEN2<-as.numeric(echo$SB_car2)
echo[flip.DEN,"SB_favorite1"]<-as.numeric(echo[flip.DEN,"SB_den1"])
echo[flip.DEN,"SB_favorite2"]<-as.numeric(echo[flip.DEN,"SB_den2"])
echo[flip.DEN,"CARvDEN1"]<-100-as.numeric(echo[flip.DEN,"SB_den1"])
echo[flip.DEN,"CARvDEN2"]<-100-as.numeric(echo[flip.DEN,"SB_den2"])

echo$NH_favorite1<-echo$WINvLOSE1<-as.numeric(echo$NH_win1)
echo$NH_favorite2<-echo$WINvLOSE2<-as.numeric(echo$NH_win2)
echo[flip.LOSE,"NH_favorite1"]<-as.numeric(echo[flip.LOSE,"NH_lose1"])
echo[flip.LOSE,"NH_favorite2"]<-as.numeric(echo[flip.LOSE,"NH_lose2"])
echo[flip.LOSE,"WINvLOSE1"]<-100-as.numeric(echo[flip.LOSE,"NH_lose1"])
echo[flip.LOSE,"WINvLOSE2"]<-100-as.numeric(echo[flip.LOSE,"NH_lose2"])

