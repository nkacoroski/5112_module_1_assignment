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

# Create a new data frame with only urban households (hv025)
urban_household <- filter(nfhs, hv025 == 1)

# Create a boxplot that shows the distribution of household size by type of urban area
# using hv026 (place of residence) as type of urban area. 
ggplot(data = urban_household, mapping = aes(x = factor(hv026), y = hv009)) + 
  geom_boxplot() +
  scale_x_discrete(labels = c("Large City","Small City", "Town")) +
  xlab("Type of Urban Area") +
  ylab("Number of Household Members") +
  theme_minimal()

# Means and medians of the number of household members by type of urban area
urban_household %>%
  group_by(factor(hv026)) %>%
  summarise(
    mean_size = mean(hv009),
    median_size = median(hv009)
  )
