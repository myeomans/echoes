essays<-c("sb_ad_den","sb_ad_car","nh_ad_win","nh_ad_lose",
          "sb_op_den","sb_op_car","nh_op_win","nh_op_lose",
          "control")

echo$essay<-apply(echo[,essays], 1, paste, collapse="")

echo$nostance<-1*(!is.na(word_count(echo[,essays[9]])))

echo$advocate<-1*(!is.na(word_count(apply(echo[,essays[1:4]], 1, paste, collapse=""))))
echo$opposite<-1*(!is.na(word_count(apply(echo[,essays[5:8]], 1, paste, collapse=""))))

echo$topic_SB<-1*(!is.na(word_count(apply(echo[,essays[c(1,2,5,6)]], 1, paste, collapse=""))))
echo$topic_NH<-1*(!is.na(word_count(apply(echo[,essays[c(3,4,7,8)]], 1, paste, collapse=""))))

table(echo[,c("advocate","opposite","nostance")])
table(echo[,c("topic_SB","topic_NH","nostance")])

echo$treatment<-c("nostance","advocate","opposite")[1+echo$advocate+2*echo$opposite]
echo$topic<-c("notopic","SB","NH")[1+echo$topic_SB+2*echo$topic_NH]