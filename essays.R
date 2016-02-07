
echo$essay_wc<-word_count(echo$essay)


mean(echo[echo$treatment=="advocate",]$essay_wc)
mean(echo[echo$treatment=="opposite",]$essay_wc)
mean(echo[echo$treatment=="nostance",]$essay_wc) # this one is the longest!

