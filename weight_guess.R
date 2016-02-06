names(echo)[names(echo)%in%c("Q79_1")]<-"weight.confidence"
names(echo)[names(echo)%in%c("Q37")]<-"weight.estimate"
echo$weight.estimate<-as.numeric(echo$weight.estimate)
echo$weight.confidence<-as.numeric(echo$weight.confidence)

summary(aov(weight.confidence~treatment, data=echo))
summary(lm(weight.confidence~nostance, data=echo))

#png("Figure_4.png", width=625, height=525)
weight.CIs<-weight.points<-array(NA, c(3,1),dimnames=list(c("adv","opp","ctrl"),NA))

weight.points[1,1]<-mean(echo[echo$treatment=="advocate","weight.confidence"])
weight.points[2,1]<-mean(echo[echo$treatment=="opposite","weight.confidence"])
weight.points[3,1]<-mean(echo[echo$treatment=="nostance","weight.confidence"])

weight.CIs[1,1]<-SEM(echo[echo$treatment=="advocate","weight.confidence"], CI=T)
weight.CIs[2,1]<-SEM(echo[echo$treatment=="opposite","weight.confidence"], CI=T)
weight.CIs[3,1]<-SEM(echo[echo$treatment=="nostance","weight.confidence"], CI=T)

par(mar=c(3,5,3,1), mfrow=c(1,1))
BP<-barplot(weight.points, beside=T, space=0.5, ylim=c(40,62),
            col=c("red","blue","orange"), xpd=F,
            xaxt="n", xlab="", cex.main=2, main="Effect of Arguing on Weight Estimates    ",
            yaxt="n", cex.lab=1.5, ylab="Estimated Probability of Being Correct")
abline(h=0)
#barplot(weight.points, add=T, col=c("red","blue","orange"), 
#        xaxt="n", yaxt="n", border=NA, beside=T, xlim=c(0.4,9), space=c(0.5,0.5,1,0.5,1))
error.bar(BP, t(weight.points), upper=t(weight.CIs),col=c("firebrick4","navy","firebrick4","navy","brown"))
axis(side=1, at=c(0,BP,10), label=c("","Advocate","Opposite","Control",""), cex.axis=1.7)
axis(side=2, at=seq(-100,100,10), label=paste0(seq(-100,100,10),"%"), cex.axis=1.5)
LL<-legend(x=3, y=62, cex=1.7,text.width=0.8, lwd=0,
           pt.cex=0,legend="95% CI")
error.bar(x=LL$text$x[1]-0.35, y=LL$text$y[1], upper=0.7)
#dev.off()
rm(BP,weight.points,weight.CIs,LL)