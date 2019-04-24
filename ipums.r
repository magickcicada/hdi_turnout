# deatch all non-base packages
lapply(paste('package:',names(sessionInfo()$otherPkgs),sep=""),
       detach, character.only=TRUE, unload=TRUE)


library(psych)
library(AER)
library(plm)
library(lfe)
library(haven)
library(ipumsr)
library(srvyr)
library(tidyverse)



# import & back up
ddi <- read_ipums_ddi("sources/ipums/usa_00003.xml")
data10 <- read_ipums_micro(ddi)
data10_bu <- data10

# check out
str(data10)
View(data10[sample(1:3061692, 12, replace = F), ])


# drop over/under detatiled columns
data10 <- data10 %>% 
  select(STATEFIP, SEX, AGE, RACE, HISPAN, CITIZEN, SCHOOL, EDUCD, INCTOT) %>% 
  rename(fips = STATEFIP,
         sex = SEX,
         age = AGE,
         race = RACE,
         hisp = HISPAN,
         cit = CITIZEN,
         school = SCHOOL,
         educ = EDUCD,
         income = INCTOT)



# which have value labels
data10 %>% select_if(is.labelled)


# apply labels to create factors
factors <- data10 %>% 
  mutate(
    state = as_factor(lbl_clean(fips)), # state name as factor
    fips = as.numeric(fips), # plain numeric fips code
    agefct = as_factor(lbl_collapse(age, ~.lbl)), # get coded values (others NA)
    sex = as_factor(lbl_clean(sex)), # generic factor
    race = as_factor(lbl_clean(race)), # generic factor
    hisp = as_factor(lbl_clean(hisp)), # generic factor
    cit = as_factor(lbl_clean(cit)), # generic factor
    school = as_factor(lbl_clean(school)), # generic factor
    educ = as_factor(lbl_clean(educ)), # generic factor
    incfct = as_factor(lbl_collapse(income, ~.lbl)) # get coded (others NA)
  )

# find test labels for special codes in continuous numeric variables
levels(factors$agefct) # probably ok to just leave as-is, convert to numeric
levels(factors$incfct)


# other facotr levels
levels(factors$state) # Ok
levels(factors$sex) # Ok
levels(factors$race) # combine Chi, Japn, & Other As/PI;  2+ & 3+
levels(factors$hisp) # make binary?
levels(factors$school) # make binary, w/ N/A == NA
  summary(factors$school, na.rm = F)
levels(factors$educ)
  summary(factors$educ, na.rm = F)
  # 1 [N/A] == NA
  # 2-16 == less than hs
  # 17-21 == hs grad, some coll, assoc.
  # 22 == bachelor's
  # 23-25 = grad/professional
  


# redo with replacements for income & recodes
recode <- data10 %>% 
  mutate(
    state = as_factor(lbl_clean(fips)), # state name as factor
    fips = as.numeric(fips), # plain numeric fips code
    sex = as_factor(lbl_clean(sex)), # generic factor
    age = as.numeric(age),
    race = as_factor(
      lbl_clean(
        lbl_relabel(
          race,
          lbl(4, "Asian or Pacific Islander") ~.val %in% 4:6,
          lbl(7, "Other race") ~.val == 7,
          lbl(8, "More than one race") ~.val %in% c(8,9)
        )
      )
    ),
    hisp = as_factor(
      lbl_clean(
        lbl_relabel(
          hisp,
          lbl(0, "No") ~.val == 0,
          lbl(1, "Yes") ~.val %in% 1:4
        )
      )
    )
  )
