###################################################
#          The Echoes of an Argument              #
#               February 5, 2016                  #
#          Don Moore and Mike Yeomans             #
###################################################

# Dependencies
library(devtools)
install_github("myeomans/yeomansroot@yeomansroot")
library(yeomansroot) # just for SEM & error.bar in plots
require(qdap) # word counting

# Loading the Qualtrics data
#echo<-read.csv("echoes1.csv", stringsAsFactors=F)
load("echo.RData")

# Data Cleaning
source("cleaning.R")    # renaming variables
source("exclusions.R")  # attention checks, IP check, incompletes
source("treatments.R")  # random assignment and essay text
source("estimates.R")   # probability estimates
source("quiz.R")        # scoring the knowledge quiz
source("covariates.R")  # other non-focal measures

# Results
source("descriptives.R")      # average confidence, condition sizes
source("treatment_effects.R") # test of predicted main effects
source("essays.R")            # essay text

# Figures
source("probability_distributions.R")  # inconsistent probability estimates (Figure 1)
source("bar_plot.R")          # plot of main effects, simple differences (Figure 2)
source("change_plot.R")       # plot of main effects over time (Figure 3)
source("weight_guess.R")      # plot of effects on weight guesses (Figure 4)
#source(".R")
#source(".R")