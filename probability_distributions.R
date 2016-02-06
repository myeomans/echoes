par(mfrow=c(2,2))
plot(table(echo$NH_favorite1), xlim=c(0,100),
     main="Primary Favorite - before", xaxt="n")
axis(side=1, at=seq(0,100,10), label=seq(0,100,10))
abline(v=50, col="red", lty=3, lwd=3)
plot(table(echo$NH_favorite2), xlim=c(0,100),
     main="Primary Favorite - after", xaxt="n")
axis(side=1, at=seq(0,100,10), label=seq(0,100,10))
abline(v=50, col="red", lty=3, lwd=3)
plot(table(echo$SB_favorite1), xlim=c(0,100),
     main="Super Bowl Favorite - before", xaxt="n")
axis(side=1, at=seq(0,100,10), label=seq(0,100,10))
abline(v=50, col="red", lty=3, lwd=3)
plot(table(echo$SB_favorite2), xlim=c(0,100),
     main="Super Bowl Favorite - after", xaxt="n")
axis(side=1, at=seq(0,100,10), label=seq(0,100,10))
abline(v=50, col="red", lty=3, lwd=3)