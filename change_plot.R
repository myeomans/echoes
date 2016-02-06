#png("Figure_3.png", width=625, height=525)

plot.CIs<-plot.points<-array(NA, c(5,2),
                             dimnames=list(c("tgt-ad","tgt-op","off-ad","off-op","ctrl"),
                                           c("pre","post")))

plot.points[1,]<-colMeans(echo[echo$treatment=="advocate",paste0("target_favorite",1:2)])
plot.points[2,]<-colMeans(echo[echo$treatment=="opposite",paste0("target_favorite",1:2)])
plot.points[3,]<-colMeans(echo[echo$treatment=="advocate",paste0("other_favorite",1:2)])
plot.points[4,]<-colMeans(echo[echo$treatment=="opposite",paste0("other_favorite",1:2)])
plot.points[5,]<-colMeans(echo[echo$treatment=="nostance",paste0("avg_favorite",1:2)])

plot.CIs[1,]<-apply(echo[echo$treatment=="advocate",paste0("target_favorite",1:2)], 2, SEM, CI=T)
plot.CIs[2,]<-apply(echo[echo$treatment=="opposite",paste0("target_favorite",1:2)], 2, SEM, CI=T)
plot.CIs[3,]<-apply(echo[echo$treatment=="advocate",paste0("other_favorite",1:2)], 2, SEM, CI=T)
plot.CIs[4,]<-apply(echo[echo$treatment=="opposite",paste0("other_favorite",1:2)], 2, SEM, CI=T)
plot.CIs[5,]<-apply(echo[echo$treatment=="nostance",paste0("avg_favorite",1:2)], 2, SEM, CI=T)

par(mar=c(3,5,3,1),mfrow=c(1,1))
plot(NA, xlab="", xaxt="n", cex.main=2, main="Effect of Arguing on Probabilities",
     xlim=c(1,3), ylim=c(60,75), yaxt="n", cex.lab=1.8, ylab="Probability of Likeliest Outcome")
axis(side=1, at=c(1.5,2.5),label=c("Before","After"), tick=F, cex.axis=2.5)
axis(side=2, at=seq(0,100,5), label=paste0(seq(0,100,5),"%"), cex.axis=1.8)
LL<-legend(x=2.15, y=65, cex=1.4,text.width=0.4, lwd=2, seg.len=4,
       pt.cex=c(1.5,1.5,1,1,2,0),lty=c(5,3,1,1,1,0),
       pch=c(17,19,15,15,15),col=c("black","black","red","blue","orange"),
       legend=c("Advocate","Opposite","On-Topic", "Off-Topic","Control","95% CI"))
error.bar(x=LL$text$x[6]-0.18, y=LL$text$y[6], upper=0.3)

error.bar(x=c(1.5,2.5), y=plot.points["ctrl",], upper=plot.CIs["ctrl",], col="snow4")
points(x=c(1.5,2.5), y=plot.points["ctrl",], col="orange", pch=15, cex=1.5)
lines(x=c(1.5,2.5), y=plot.points["ctrl",], col="orange")

error.bar(x=c(1.4,2.4), y=plot.points["tgt-ad",], upper=plot.CIs["tgt-ad",], col="snow4")
points(x=c(1.4,2.4), y=plot.points["tgt-ad",], col="red", pch=17, cex=1.5)
lines(x=c(1.4,2.4), y=plot.points["tgt-ad",], col="red", lty=5)

error.bar(x=c(1.55,2.55), y=plot.points["tgt-op",], upper=plot.CIs["tgt-op",], col="snow4")
points(x=c(1.55,2.55), y=plot.points["tgt-op",], col="red", pch=19, cex=1.5)
lines(x=c(1.55,2.55), y=plot.points["tgt-op",], col="red", lty=3)

error.bar(x=c(1.45,2.45), y=plot.points["off-ad",], upper=plot.CIs["off-ad",], col="snow4")
points(x=c(1.45,2.45), y=plot.points["off-ad",], col="blue", pch=17, cex=1.5)
lines(x=c(1.45,2.45), y=plot.points["off-ad",], col="blue", lty=5)

error.bar(x=c(1.6,2.6), y=plot.points["off-op",], upper=plot.CIs["off-ad",], col="snow4")
points(x=c(1.6,2.6), y=plot.points["off-op",], col="blue", pch=19, cex=1.5)
lines(x=c(1.6,2.6), y=plot.points["off-op",], col="blue", lty=3)
#dev.off()
rm(plot.points, plot.CIs,LL)
