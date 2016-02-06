# Lots of work to do here


# 1 to 7 - "strong preference for trump loss" to "strong preference for trump win"
plot(table(echo$preference.nh))

# 1 to 7 - "strong denver preference" to "strong carolina preference"
plot(table(echo$preference.sb))

# 1 to 5 c("democrat", "dem-independent", "independent", "gop-independent", "republican")
plot(table(echo$party.affiliation))

# 1 to 7 - "not at all" to "extremely" important
plot(table(echo$importance.nh))
plot(table(echo$importance.sb))

