#echo<-read.csv("echoes1.csv", stringsAsFactors=F)
load("echo.RData")

library(qdap)

# DATA CLEANING

source("exclusions.R")  # load data, attention checks
source("treatments.R")  # random assignment and essay text
source("estimates.R")   # probability estimates
source("quiz.R")        # scoring the knowledge quiz
source("covariates.R")  # other non-focal measures

# RESULTS
source("probability_distributions.R")  # a few funny-looking responses here
source("treatment_effects.R")