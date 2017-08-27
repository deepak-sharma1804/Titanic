library("dplyr")
install.packages("xlsx")
library("xlsx")
#library("")

# load initial dataset

titanic <- read.xlsx("D://Data_Wrangling//titanic3.xls",sheetIndex = 1)

# adding value to missig embarked column

titanic <- titanic %>% mutate(embarked=ifelse(is.na(embarked),"S",embarked))

# filling age 

#fill_age <- fill_embarked_dataset %>% mutate(age = ifelse(is.na(age),mean(age,na.rm = T),age))

return_age <- function(age,avg_of_age){
  if(is.na(age))
    return(as.double(avg_of_age))
  else return(as.double(age))
}

titanic$age <- sapply(titanic$age,FUN = return_age,avg_of_age = mean(titanic$age,na.rm = T))

# filling boat with null values

titanic$boat <- ifelse(is.na(titanic$boat),"None",titanic$boat)
#titanic <- as.tbl(titanic)
#titanic$boat[is.na(titanic$boat)] <- 'None'

titanic <- titanic %>% mutate(has_cabin_number = ifelse(is.na(cabin),0,1))

# Writing the final output

write.csv(file = "D:\\titanic_clean.csv",x = titanic)
#titanic_clean.csv.
