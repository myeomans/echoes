names(echo)[names(echo)%in%paste0("Q", 13:20)]<-c(paste0("QUIZ.text.nh",1:4),paste0("QUIZ.text.sb",1:4))

quizgrader<-function(answers, guesses, lower=T){
  correct<-rep(F, length(guesses))
  if (lower==T) guesses<-tolower(guesses)
  for(A in 1:length(answers)){
    correct<-correct|grepl(answers[A], guesses, fixed=T)
  }
  print(table(guesses[!correct]))
  return(correct)
}
echo$NHquiz1<-quizgrader(c("biden","joe","bidon"),echo$QUIZ.text.nh1) 
echo$NHquiz2<-quizgrader(c("ryan","rayan"),echo$QUIZ.text.nh2) 
echo$NHquiz3<-quizgrader(c("mccain","mcain","mckain","maccain"),echo$QUIZ.text.nh3) 
echo$NHquiz4<-quizgrader(c("romney","romeny","rommeny","roomney"),echo$QUIZ.text.nh4) 

echo$SBquiz1<-quizgrader(c("newton","newtwon"),echo$QUIZ.text.sb1) 
echo$SBquiz2<-quizgrader(c("mannin","peyton"),echo$QUIZ.text.sb2)
# Complicated... "Eli Manning".   also: "the guy in the pizza ad"
echo$SBquiz2<-echo$SBquiz2-1*(grepl("eli manning",echo$QUIZ.text.sb2))
echo$SBquiz3<-quizgrader(c("patriots","new england"),echo$QUIZ.text.sb3) 
echo$SBquiz4<-quizgrader(c("cardinals","arizona"),echo$QUIZ.text.sb4) 

echo$NHquiz<-rowSums(echo[,paste0("NHquiz",1:4)])
echo$SBquiz<-rowSums(echo[,paste0("SBquiz",1:4)])