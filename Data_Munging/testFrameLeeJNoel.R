setwd("C:\\Users\\LeeNoel\\OneDrive\\Desktop\\Intro Data Science\\Data_Munging")

urlToRead<-"https://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"

testFrame<-read.csv(url(urlToRead))
str(testFrame)

#read the first few  lines
head(testFrame)

#structure of test frame
str(testFrame)

#removing rows and columns: remove header rows using minus first 8 rows
testFrame <- testFrame[-1:-8,]
head(testFrame)

summary(testFrame[,6:10])

#keeps the first five columns of the dataframe:
testFrame <- testFrame[,1:5]
testFrame

#tail() shows the last few rows from Cenus notes:
tail(testFrame,5)

#removes the blank/unnecessary rows
testFrame <- testFrame[-52:-58,]
tail(testFrame)

#renaming first column copied long into statename
testFrame$stateName <- testFrame[,1]
head(testFrame)
tail(testFrame)

#colnames() function
colnames(testFrame)

#drop the first column
testFrame<- testFrame[,-1]
head(testFrame)

#cleaning up the elements
testFrame$stateName <- gsub("\\.","",testFrame$stateName)
head(testFrame)

#first get rid of the commas
testFrame$april10cenus <- gsub(",","",testFrame$X)
testFrame$april10base <- gsub(",","",testFrame$X.1)
testFrame$july10pop <- gsub(",","",testFrame$X.2)
testFrame$july11pop <- gsub(",","",testFrame$X.3)

#Get rid of spaces and convert to number
testFrame$april10cenus <- as.numeric(gsub(" ","",testFrame$april10cenus))
testFrame$april10base <- as.numeric(gsub(" ","",testFrame$april10base))
testFrame$july10pop <- as.numeric(gsub(" ","",testFrame$july10pop))
testFrame$july11pop <- as.numeric(gsub(" ","",testFrame$july11pop))

#Removes the columns with the columns with the X names:
testFrame <- testFrame[,-1:-4]

str(testFrame)

#row names
rownames(testFrame) <- NULL
testFrame

#move the last column to the first
library(dplyr)
new_testFrame<-testFrame %>% select(stateName, everything())

write.csv(new_testFrame, "testFrame.L.N.csv")
