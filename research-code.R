
# Code for Radiographic Templating Analysis

# Set the working directory
setwd("/Users/adeebalomar/Statistical-Analysis")

# Load the necessary libraries
install.packages("Matrix")
library(Matrix)
install.packages("lme4")
library(lme4)
install.packages("lmerTest")
library(lmerTest)

# Load the dataset
V3_LMM_IMA <- read.csv("V3_LMM_IMA.csv")

# List of angles to calculate ICC for
angles <- c("CI", "IMA", "MA", "T1MA", "LMM")

# Loop through each angle and fit the linear mixed model
for (angle in angles) {
  formula <- as.formula(paste0(angle, " ~ Age + Sex + Race + (1 | ID)"))
  model <- lmer(formula, data = V3_LMM_IMA)
  
  # Print the summary with p-values for each model
  cat("\nModel Summary for", angle, ":\n")
  summary(model)
};

           
