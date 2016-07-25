education <- read.dta("Z:/Ferguson 13 march/other assignment/DS/Development sector/HIES 2012-2013/DATA/sec_c.dta")
education <- education[,c(2,4,10,12:17)]

education1 <- education[complete.cases(education$scq04),]
education1 = education1 %>% group_by(province,district,scq04) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

education2 <- education[complete.cases(education$scq06),]
education2 = education2 %>% group_by(province,district,scq06) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

education3 <- education[complete.cases(education$scq07),]
education3 = education3 %>% group_by(province,district,scq07) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

education4 <- education[complete.cases(education$scq081),]
education4 = education4 %>% group_by(province,district,scq081) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

education5 <- education[complete.cases(education$scq082),]
education5 = education5 %>% group_by(province,district,scq082) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

education6 <- education[complete.cases(education$scq091),]
education6 = education6 %>% group_by(province,district,scq091) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

education7 <- education[complete.cases(education$scq092),]
education7 = education7 %>% group_by(province,district,scq092) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

education1$factor <- colnames(education1)[3]
education2$factor <- colnames(education2)[3]
education3$factor <- colnames(education3)[3]
education4$factor <- colnames(education4)[3]
education5$factor <- colnames(education5)[3]
education6$factor <- colnames(education6)[3]
education7$factor <- colnames(education7)[3]

colnames(education1)[3] <- "attribute"
colnames(education2)[3] <- "attribute"
colnames(education3)[3] <- "attribute"
colnames(education4)[3] <- "attribute"
colnames(education5)[3] <- "attribute"
colnames(education6)[3] <- "attribute"
colnames(education7)[3] <- "attribute"



education <- rbind(education1,education2,education3,education4,
                   education5,education6,education7)
education <- filter(education, factor != "scq082" & factor != "scq092")
library(plyr)
education$factor <- mapvalues(education$factor, c("scq04", "scq06", "scq07",
                                                  "scq081",  "scq091"),
                              c("Highest level of education attained",
                                "Current grade", "Type of Institution", "Problems in the Instituion",
                                "Reason for not attending education Institution"))
