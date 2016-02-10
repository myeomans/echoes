plot(density(echo$WINvLOSE1, from=0, to=100), main="Probability Trump Loses")
abline(v=63, col="blue", lwd=2, lty=2)
lines(density(echo[echo$treatment=="advocate",]$WINvLOSE2), 
      from=0, to=100, col="red")

lines(density(echo[echo$treatment=="opposite",]$WINvLOSE2), 
      from=0, to=100, col="orange")


plot(density(echo$CARvDEN1, from=0, to=100), main="Probability CAR wins")
abline(v=63, col="blue", lwd=2, lty=2)
lines(density(echo[echo$treatment=="advocate",]$CARvDEN2, 
              from=0, to=100,), col="red")

lines(density(echo[echo$treatment=="opposite",]$CARvDEN2,
              from=0, to=100,), col="orange")
