# average confidence
mean(c(echo$avg_favorite1,echo$avg_favorite2)) 


# Decent balance for each question!
table(echo$NH_cx_name, useNA="ifany")
table(echo$SB_cx_name, useNA="ifany")

table(echo$treatment)
table(echo[,c("advocate","opposite","nostance")])

table(echo$topic)
table(echo[,c("topic_SB","topic_NH","nostance")])
