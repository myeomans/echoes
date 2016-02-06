echo$NH_cx_name<-c("win","lose")[as.numeric(echo$NH_choice)]
echo$SB_cx_name<-c("car","den")[as.numeric(echo$SB_choice)]

# Sensible names for probability estimate data
names(echo)[names(echo)%in%c("Q53_1")]<-"SB_car1"
names(echo)[names(echo)%in%c("Q52_1")]<-"SB_den1"
names(echo)[names(echo)%in%c("Q31_1")]<-"NH_win1"
names(echo)[names(echo)%in%c("Q48_1")]<-"NH_lose1"
names(echo)[names(echo)%in%c("Q54_1")]<-"SB_car2"
names(echo)[names(echo)%in%c("Q55_1")]<-"SB_den2"
names(echo)[names(echo)%in%c("Q57_1")]<-"NH_win2"
names(echo)[names(echo)%in%c("Q56_1")]<-"NH_lose2"

# ONE EXTRA GUY WITH INCOMPLETE DATA!
echo<-(echo[!((echo$SB_den1=="")&(echo$SB_car1=="")),])
##############################################################################
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

echo$SB_favorite_change<-echo$SB_favorite2-echo$SB_favorite1
echo$NH_favorite_change<-echo$NH_favorite2-echo$NH_favorite1

rm(flip.DEN, flip.LOSE)
##############################################################################
echo$avg_favorite1<-(echo$NH_favorite1+echo$SB_favorite1)/2
echo$avg_favorite2<-(echo$NH_favorite2+echo$SB_favorite2)/2
echo$avg_favorite_change<-echo$avg_favorite2-echo$avg_favorite1

echo[,paste0("target_",c("favorite1","favorite2","favorite_change"))]<-NA
echo[,paste0("other_",c("favorite1","favorite2","favorite_change"))]<-NA

echo[echo$topic=="NH",]$target_favorite1<-echo[echo$topic=="NH",]$NH_favorite1
echo[echo$topic=="NH",]$target_favorite2<-echo[echo$topic=="NH",]$NH_favorite2
echo[echo$topic=="SB",]$target_favorite1<-echo[echo$topic=="SB",]$SB_favorite1
echo[echo$topic=="SB",]$target_favorite2<-echo[echo$topic=="SB",]$SB_favorite2
echo[echo$topic=="NH",]$target_favorite_change<-echo[echo$topic=="NH",]$NH_favorite_change
echo[echo$topic=="SB",]$target_favorite_change<-echo[echo$topic=="SB",]$SB_favorite_change

echo[echo$topic=="NH",]$other_favorite1<-echo[echo$topic=="NH",]$SB_favorite1
echo[echo$topic=="NH",]$other_favorite2<-echo[echo$topic=="NH",]$SB_favorite2
echo[echo$topic=="SB",]$other_favorite1<-echo[echo$topic=="SB",]$NH_favorite1
echo[echo$topic=="SB",]$other_favorite2<-echo[echo$topic=="SB",]$NH_favorite2
echo[echo$topic=="NH",]$other_favorite_change<-echo[echo$topic=="NH",]$SB_favorite_change
echo[echo$topic=="SB",]$other_favorite_change<-echo[echo$topic=="SB",]$NH_favorite_change
##############################################################################