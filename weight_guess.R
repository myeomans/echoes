
names(echo)[names(echo)%in%c("Q79_1")]<-"weight.confidence"
names(echo)[names(echo)%in%c("Q37")]<-"weight.estimate"

#png("weight.png",height=500,width=600)
par(mfrow=c(1,1))
plot(density(as.numeric(echo[echo$treatment=="nostance",]$weight.confidence), from=0, to=100), col="black",
     main="Overconfidence in Weight Estimates")
lines(density(as.numeric(echo[echo$treatment=="advocate",]$weight.confidence), from=0, to=100), col="red")
lines(density(as.numeric(echo[echo$treatment=="opposite",]$weight.confidence), from=0, to=100), col="blue")
legend(x=40, y=.007, lty=1, pt.cex=0, text.width=20,
       legend=c("control","advocate","opposite"),
       col=c("black","red","blue"))
#dev.off()

summary(aov(weight.confidence~treatment, data=echo))

summary(lm(weight.confidence~nostance, data=echo))
