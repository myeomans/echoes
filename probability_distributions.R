png("Figure_1.png", width=750, height=500)
par(mfrow=c(2,2), mar=c(5,5,2,2))
judgments<-list(nh1=echo$NH_favorite1,
                nh2=echo$NH_favorite2,
                sb1=echo$SB_favorite1,
                sb2=echo$SB_favorite2)
judgment.names<-list(nh1="NH Primary Favorite - before",
                     nh2="NH Primary Favorite - after",
                     sb1="Super Bowl Favorite - before",
                     sb2="Super Bowl Favorite - after")

for (J in 1:length(judgments)){
  plot(table(judgments[[J]]), xlim=c(0,100),
       ylab="Number of Participants", cex.main=1.5,
       xlab="Estimated Probability of Likeliest Outcome",
       main=judgment.names[[J]], xaxt="n")
  axis(side=1, at=seq(0,100,10), label=seq(0,100,10))
  abline(v=50, col="red", lty=3, lwd=3)

}
dev.off()
rm(judgments, judgment.names,J)