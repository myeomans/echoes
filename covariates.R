flip.DEN <-(echo$SB_cx_name=="den")
flip.LOSE<-(echo$NH_cx_name=="lose")

echo$preference.nh<-as.numeric(echo$preference.nh)
echo$preference.sb<-as.numeric(echo$preference.sb)

# 1 to 7 - "strong preference for trump loss" to "strong preference for trump win"
plot(table(echo$preference.nh))
echo$NH_favorite_pref<-echo$preference.nh
echo[flip.LOSE,"NH_favorite_pref"]<-echo[flip.LOSE,"preference.nh"]

# 1 to 7 - "strong denver preference" to "strong carolina preference"
plot(table(echo$preference.sb))
echo$SB_favorite_pref<-echo$preference.sb
echo[flip.DEN,"SB_favorite_pref"]<-echo[flip.DEN,"preference.sb"]

# 1 to 7 - "not at all" to "extremely" important
plot(table(echo$importance.nh))
echo$NH_favorite_import<-echo$importance.nh
echo[flip.LOSE,"NH_favorite_import"]<-echo[flip.LOSE,"importance.nh"]

plot(table(echo$importance.sb))
echo$SB_favorite_import<-echo$importance.sb
echo[flip.DEN,"SB_favorite_import"]<-echo[flip.DEN,"importance.sb"]

# 1 to 5 c("democrat", "dem-independent", "independent", "gop-independent", "republican")
plot(table(echo$party.affiliation))


rm(flip.DEN, flip.LOSE)