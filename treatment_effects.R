# Decent balance for each question!
table(echo$NH_cx_name, useNA="ifany")
table(echo$SB_cx_name, useNA="ifany")

echo$NH_favorite_change<-echo$NH_favorite2-echo$NH_favorite1
echo$SB_favorite_change<-echo$SB_favorite2-echo$SB_favorite1

echo$target_favorite_change<-echo$other_favorite_change<-NA
echo[echo$topic=="NH",]$target_favorite_change<-echo[echo$topic=="NH",]$NH_favorite_change
echo[echo$topic=="NH",]$other_favorite_change <-echo[echo$topic=="NH",]$SB_favorite_change
echo[echo$topic=="SB",]$target_favorite_change<-echo[echo$topic=="SB",]$SB_favorite_change
echo[echo$topic=="SB",]$other_favorite_change <-echo[echo$topic=="SB",]$NH_favorite_change

summary(aov(target_favorite_change~treatment, data=echo))
summary(aov(other_favorite_change~treatment, data=echo))

table(echo$topic)
table(echo$treatment)

