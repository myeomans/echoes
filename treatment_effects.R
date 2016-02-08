####################################################
# TESTING THE SLOPE OF CHANGE 
####################################################
FF<-T

# No secular trend... always good to check
t.test(echo[FF&(echo$treatment=="nostance"),"avg_favorite_change"], mu=0)

# No surprise here
t.test(echo[FF&(echo$treatment=="advocate"),"target_favorite_change"], mu=0)
# Replicating Minson et al.
t.test(echo[FF&(echo$treatment=="advocate"),"other_favorite_change"], mu=0)
# No change at all! Interesting
t.test(echo[FF&(echo$treatment=="opposite"),"target_favorite_change"], mu=0)
# Here's where things get weird
t.test(echo[FF&(echo$treatment=="opposite"),"other_favorite_change"], mu=0)

summary(lm(target_favorite_change~treatment, data=echo))


FILTER<-(echo$treatment=="advocate")
t.test(echo[FILTER,]$target_favorite_change,
       echo[FILTER,]$other_favorite_change,
       paired=T)


# TT<-"nostance"
# t.test(echo[echo$treatment==TT,]$NH_favorite2, 
#        echo[echo$treatment==TT,]$NH_favorite1,
#        paired=T)

# summary(aov(target_favorite_change~treatment, data=echo))
# summary(aov(other_favorite_change~treatment, data=echo))
# 
# summary(lm(target_favorite_change~treatment, data=echo))
