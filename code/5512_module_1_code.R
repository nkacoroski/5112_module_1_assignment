# Import libraries
library(tidyverse)
library(haven)

# Load data
nfhs <- read_dta("raw_data/IAHR52FL.dta")

# How many households are there?
# Confirmed in Summary of Findings 'FRIND3-Vol1AndVol2.pdf' that households
# equal the number of observations.

# How many variables are there?
# 3588

# Subset data to keep variables between 'hhid' and 'shstruc'
nfhs_hhid_shstruc <- select(nfhs, hhid:shstruc)

# Plot the distribution of the number of listed household members for the 
# entire sample. Export plot from Rstudio. hv009 = number of household members
ggplot(data = nfhs_hhid_shstruc, mapping = aes(x = hv009)) +
  geom_histogram(fill = "black", binwidth = 1) +
  xlab("Number of Household Members") +
  ylab("Count") +
  theme_minimal()
