# Decent balance for each question!
table(echo$NH_cx_name, useNA="ifany")
table(echo$SB_cx_name, useNA="ifany")

table(echo$topic)

echo$NH_favorite_change<-echo$NH_favorite2-echo$NH_favorite1
echo$SB_favorite_change<-echo$SB_favorite2-echo$SB_favorite1

