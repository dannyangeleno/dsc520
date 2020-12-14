# Assignment: ASSIGNMENT 2
# Name: Angel, Daniel
# Date: 2020-12-13

getwd()

dir()

person_df1 <- read.csv(file = 'person.csv' , stringsAsFactors = TRUE)

str(person_df1)

person_df2 <- read.csv(file = 'person.csv' , stringsAsFactors = FALSE)

str(person_df2)

scores_df <- read.csv(file = 'scores.csv')

str(scores_df)


library('readxl')

excel_sheets('G04ResultsDetail2004-11-02.xls')

voter_turnout_df1 <- read_excel('G04ResultsDetail2004-11-02.xls' , sheet = 2 ,
                                skip = 1)
str(voter_turnout_df1)

turnout_col_names <- c("ward_precint" , "ballots_cast" ,
                       "registered_voters" , "voter_turnout")
voter_turnout_df2 <- read_excel('G04ResultsDetail2004-11-02.xls' , 
                                sheet = "Voter Turnout" , 
                                col_names = turnout_col_names , skip = 2)

str(voter_turnout_df2)

library('DBI')

db <- dbConnect(RSQLite::SQLite(), 'example.db')

person_df <- dbGetQuery(db, "SELECT * FROM PERSON")
head(person_df)

table_names <- dbListTables(db)

tables <- lapply(table_names, dbReadTable, conn=db)
tables

dbDisconnect()

library('jsonlite')

toJSON(scores_df)

toJSON(scores_df, pretty=TRUE)
