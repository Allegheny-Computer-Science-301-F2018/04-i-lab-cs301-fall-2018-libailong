# Name:Bailong Li (working with Lancaster wu)
# Date:10/12/2018

# Run the below only if the library is not already installed.
install.packages(dslabs)

library(dslabs)
library(dplyr)
library(tidyverse)
data(us_contagious_diseases)

vi#Question 1.
dat <- filter(us_contagious_diseases, disease == "Measles", state != "Alaska" & state != "Hawaii")
dat <- mutate(dat,per100000rate = count * 100000/population * weeks_reporting / 52)

#Question 2.
datmc <- filter(us_contagious_diseases, state == "California",disease == "Measles")

ggplot(data = datmc) + geom_point(mapping = aes(x = year, y = count/population)) + geom_vline(xintercept = 1965)

#Question 3.

dat_caliFocus <- filter(us_contagious_diseases, state == "California", 1980 > year & year > 1949)
dat_caliFocus$yearBlock[1960 > dat_caliFocus$year & dat_caliFocus$year > 1949] <- "1950’s"
dat_caliFocus$yearBlock[1970 > dat_caliFocus$year & dat_caliFocus$year > 1959] <- "1960’s"
dat_caliFocus$yearBlock[1980 > dat_caliFocus$year & dat_caliFocus$year > 1969] <- "1970’s"
ggplot(data = dat_caliFocus) + geom_bar(mapping = aes(x = state,y = count^(1/2), fill = yearBlock), width = 0.5, position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))

#Question 4.
dat_all <- filter(us_contagious_diseases, 1980 > year & year > 1949)
dat_all$yearBlock[1960 > dat_all$year & dat_all$year > 1949] <- "1950’s"
dat_all$yearBlock[1970 > dat_all$year & dat_all$year > 1959] <- "1960’s"
dat_all$yearBlock[1980 > dat_all$year & dat_all$year > 1969] <- "1970’s"
ggplot(data = dat_all) + geom_bar(mapping = aes(x = state,y = count^(1/2), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
## It shows all states

#Question 5.
ggplot(data = dat_copy) + geom_tile(mapping = aes(x = state, y = year, fill = count^(1/2)),colour = "black", position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))

#Question 6.
## find the data from https://github.com/cran/SCCS
## Name of the file: autdat
autdat <- read.delim("~/Desktop/cs301/04-i-lab-cs301-fall-2018-libailong/autdat.txt.gz")
ggplot(data = autdat) + geom_point(mapping = aes(x = case, y = diag, color = mmr))
##after run this code, we can see that darker blue points are around 1000-2000 so that indicates age at autism diagnosis are about the similar age at MMR vaccination, but there is not a clear relationship that can be proved.




