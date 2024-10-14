# Load the penguin dataset,  and 
# The 01_load_clean_data.R file reads the data using readxl, cleans it (removes row 23 and 48), 
# and saves the result in .rds format with the saveRDS() function as clean_data.rds in the input folder.

library(readxl)
library(dplyr)

setwd("~/Desktop/projects/productive-r-workflow_vscode")

# Read data using readxl
data <- read_excel("input/data.xlsx", na = "NA")

# Remove 2 rows that are known to be wrong
clean_data <- data %>%
  slice(-c(23, 48))

# Save in RDS format
saveRDS(clean_data, file = "input/clean_data.rds")

# This file can then be read in analysis.R thanks to the readRDS() function.