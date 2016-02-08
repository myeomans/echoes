# rough material on how the <50% estimators affect the overall results

plot(echo$WINvLOSE1, echo$WINvLOSE2, xlim=c(0,100),ylim=c(0,100))
plot(echo$CARvDEN1, echo$CARvDEN2, xlim=c(0,100),ylim=c(0,100))
plot(echo$SB_favorite1, echo$SB_favorite2, xlim=c(0,100),ylim=c(0,100))
plot(echo$NH_favorite1, echo$NH_favorite2, xlim=c(0,100),ylim=c(0,100))
abline(a=0, b=1 ,col="red")
abline(h=50,col="blue")
abline(v=50,col="blue")

FF<-T#(echo$lapse.one==0)
t.test(echo[FF&(echo$treatment=="advocate"),"target_favorite_change"], mu=0)
t.test(echo[FF&(echo$treatment=="advocate"),"other_favorite_change"], mu=0)
# No change at all! Interesting
t.test(echo[FF&(echo$treatment=="opposite"),"target_favorite_change"], mu=0)
# Here's where things get weird
t.test(echo[FF&(echo$treatment=="opposite"),"other_favorite_change"], mu=0)

t.test(echo[FF&(echo$treatment=="opposite"),"target_favorite_change"], 
       echo[FF&(echo$treatment=="opposite"),"other_favorite_change"],
       paired=T)

t.test(echo[FF&(echo$treatment=="advocate"),"target_favorite_change"], 
       echo[FF&(echo$treatment=="opposite"),"target_favorite_change"],
       var.equal=T)

t.test(echo[FF&(echo$treatment=="advocate"),"other_favorite_change"], 
       echo[FF&(echo$treatment=="opposite"),"other_favorite_change"],
       var.equal=T)
