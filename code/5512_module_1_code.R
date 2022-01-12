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
