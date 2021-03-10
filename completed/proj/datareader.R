library(datetime)
library(tidyverse)

year_range1 <- (86:99)
year_list1 <- NULL

for (digis in year_range1) {
  year_char <- paste(19,digis, sep = "")

  year_list1 <- append(year_list1, year_char)
  
}

year_log_dir <- paste("data", "proj", "log-", sep="\\")


for (abc in (1:length(year_list1))) {
  year <- year_list1[abc]
  year_log_path <- paste(year_log_dir, year, ".csv", sep="")
  
  season_log <- read.csv(year_log_path)
  
  abcd <-abc+1985
  
  assign(paste('seasonlog_',abcd,sep=''),season_log)

}

year_range2 <- (0:9)
year_list2 <- NULL

for (digis2 in year_range2) {
  year_char2 <- paste(200,digis2, sep = "")
  
  year_list2 <- append(year_list2, year_char2)
  
}

year_log_dir2 <- paste("data", "proj", "log-", sep="\\")


for (abc2 in (1:length(year_list2))) {
  year2 <- year_list2[abc2]
  year_log_path2 <- paste(year_log_dir, year2, ".csv", sep="")
  
  season_log2 <- read.csv(year_log_path2)
  
  def <- abc2+length(year_range1)+1985
  assign(paste('seasonlog_',def,sep=''),season_log2)
}

year_range3 <- (10:19)
year_list3 <- NULL

for (digis3 in year_range3) {
  year_char3 <- paste(20,digis3, sep = "")
  
  year_list3 <- append(year_list3, year_char3)
  
}

year_log_dir3 <- paste("data", "proj", "log-", sep="\\")


for (abc3 in (1:length(year_list3))) {
  year3 <- year_list3[abc3]
  year_log_path3 <- paste(year_log_dir, year3, ".csv", sep="")
  
  season_log3 <- read.csv(year_log_path3)
  
  ghi <- abc3+length(year_range1)+length(year_range2)+1985
  assign(paste('seasonlog_',ghi,sep=''),season_log3)
  
  
}

rm(season_log, season_log2, season_log3)

x <- sapply(sapply(ls(), get), is.data.frame)

l <- ls()
l[sapply(l, function(x) is.data.frame(get(x)))]

all_seasons <- data.frame()



for (thing in (1:length(x))){
  
  if (x[thing]){
    all_seasons <- rbind(all_seasons, get(l[thing]))
  }
  
}

str(all_seasons)

cleaner_all_seasons <- all_seasons[-c(1,2,4,5,7,29)]

which(is.na(cleaner_all_seasons$FG_PCT))

cleanerer_all_seasons <- cleaner_all_seasons[-c(63091, 63092),]

cleanest_all_seasons <- cleanerer_all_seasons

cleanest_all_seasons[is.na(cleanest_all_seasons)] <- 0
