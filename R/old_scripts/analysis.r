library(tidyverse)
library(dplyr)
# Load readxl library (Note: readxl is not part of the core tidyverse package!)
# library(readxl)

setwd("~/Desktop/projects/productive-r-workflow_vscode")
# Can remove setwd() if opening .Rproj in RStudio. (The RStudio project concept (.Rproj) does not exist in VSCode.)
# In R project no need to setwd() anymore. Loading dataset just requires:
# data <- read.csv("data.csv")

# Source functions
source(file = "R/functions.r")

# Read data using readr
## data <- readr::read_csv("input/data.csv")
## data = readr::read_excel("input/data.xlsx", na = "-")
## URL of data: ("https://raw.githubusercontent.com/holtzy/R-graph-gallery/master/DATA/data_2.csv")
# Read data using readxl
# Note: Use the na argument in the function to handle missing values correctly! Here missing data are represented with NA.)
# data <- read_excel("input/data.xlsx", na = "NA")

# Read the clean dataset
data <- readRDS(file = "input/clean_data.rds")

# Summary
summary(data)

# Calculating mean bill length for different species and islands using dplyr
data %>%
  filter(species == "Adelie") %>%
  group_by(island) %>%
  summarize(mean_bill_length = num(mean(bill_length_mm, na.rm = TRUE), digits = 2))

# Use the function in functions.R
create_scatterplot(data, "Adelie", "Torgersen")


# # Plot using ggplot2
# data %>%
#   na.omit() %>%
#   ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)) +
#   geom_point() +
#   labs(x = "Bill Length (mm)", y = "Bill Depth (mm)", title = "Penguin Bill Dimensions") +
#   scale_shape_manual(values = c("Adelie" = 16, "Chinstrap" = 17, "Gentoo" = 18))

# legend("topright",
#   legend = unique(penguins_clean$species),
#   col = c(
#     "red",
#     "green",
#     "blue"
#   ),
#   pch = c(16, 17, 18)
# )
