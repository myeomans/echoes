#png("Figure_2.png", width=625, height=525)
bar.CIs<-plot.bars<-array(NA, c(5,1),dimnames=list(c("tgt-ad","tgt-op","off-ad","off-op","ctrl"),NA))

plot.bars[1,1]<-mean(echo[echo$treatment=="advocate","target_favorite_change"])
plot.bars[2,1]<-mean(echo[echo$treatment=="advocate","other_favorite_change"])
plot.bars[3,1]<-mean(echo[echo$treatment=="opposite","target_favorite_change"])
plot.bars[4,1]<-mean(echo[echo$treatment=="opposite","other_favorite_change"])
plot.bars[5,1]<-mean(echo[echo$treatment=="nostance","avg_favorite_change"])

bar.CIs[1,1]<-SEM(echo[echo$treatment=="advocate","target_favorite_change"], CI=T)
bar.CIs[2,1]<-SEM(echo[echo$treatment=="advocate","other_favorite_change"], CI=T)
bar.CIs[3,1]<-SEM(echo[echo$treatment=="opposite","target_favorite_change"], CI=T)
bar.CIs[4,1]<-SEM(echo[echo$treatment=="opposite","other_favorite_change"], CI=T)
bar.CIs[5,1]<-SEM(echo[echo$treatment=="nostance","avg_favorite_change"], CI=T)


par(mar=c(3,5,3,1), mfrow=c(1,1))
BP<-barplot(plot.bars, beside=T,space=c(0.5,0.5,1,0.5,1), ylim=c(-5,10), xlim=c(0.4,9),
            xaxt="n", xlab="", cex.main=2, main="Effect of Arguing on Probabilities",
            yaxt="n", cex.lab=1.5, ylab="Change in Probability of Likeliest Outcome")
abline(h=0)
barplot(plot.bars, add=T, col=c("red","blue","red","blue","orange"), 
        xaxt="n", yaxt="n", border=NA, beside=T, xlim=c(0.4,9), space=c(0.5,0.5,1,0.5,1))
error.bar(BP, t(plot.bars), upper=t(bar.CIs),col=c("firebrick4","navy","firebrick4","navy","brown"))
mtext("Style of Argument", side=1, line=1, cex=2.5)
text("Advocate", x=1.75, y=-4, cex=2)
text("Opposite", x=5.25, y=-4, cex=2)
text("None",     x=8,    y=-4, cex=2)
lines(x=rep(3.5,2), y=c(0,-5), lty=2)
lines(x=rep(7,2), y=c(0,-5), lty=2)
lines(x=rep(9,2), y=c(0,-5), lty=2)
axis(side=2, at=seq(-100,100,5), label=paste0(seq(-100,100,5),"%"), cex.axis=1.5)
LL<-legend(x=4.4, y=9, cex=1.7,text.width=2.1, lwd=0,
       pt.cex=c(2,2,2,0), pt.lwd=1,
       pch=c(22,22,22),
       col=c("firebrick4","navy","brown"),
       pt.bg=c("red","blue","orange"),
       legend=c("On-Topic","Off-Topic","Control","95% CI"))
error.bar(x=LL$text$x[4]-0.62, y=LL$text$y[4], upper=0.3)
#dev.off()
rm(bar.CIs, plot.bars,LL,BP)