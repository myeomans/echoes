####################################################
#          The Echoes of an Argument
#               February 5, 2016
#          Don Moore and Mike Yeomans
####################################################

# Dependencies
install.packages("qdap")
library(devtools)
install_github("myeomans/yeomansroot@yeomansroot")
library(qdap) # word counting
library(yeomansroot) #error bars

# Loading the raw qualtrics data
#echo<-read.csv("echoes1.csv", stringsAsFactors=F)
load("echo.RData")

# DATA CLEANING
source("exclusions.R")  # load data, attention checks
source("treatments.R")  # random assignment and essay text
source("estimates.R")   # probability estimates
source("quiz.R")        # scoring the knowledge quiz
source("covariates.R")  # other non-focal measures

# RESULTS
source("descriptives.R")               # average confidence, condition sizes
source("probability_distributions.R")  # inconsistent probability estimates (Figure 1)

source("treatment_effects.R") # test of predicted main effects
source("bar_plot.R")          # plot of main effects, simple differences (Figure 2)
source("change_plot.R")       # plot of main effects over time (Figure 3)
source("weight_guess.R")      # plot of effects on weight guesses (Figure 4)
#source(".R")
#source(".R")