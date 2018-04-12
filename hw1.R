#Homework 1

# Importing files
db1<-read.csv("SampleDat_Base.csv", header = TRUE, stringsAsFactors = FALSE)
db2<-read.csv("Student_Years.csv", header = TRUE, stringsAsFactors = FALSE)
db3<-read.csv("Student_atSchool.csv", header = TRUE, stringsAsFactors = FALSE)

#Merge files db1 and db2
NDF<-merge(db1,db2, by = "ID", all = TRUE, sort = TRUE)
#Merge files NDF and db3
NDFinal<-merge(NDF, db3, by.x = "ID", by.y = "Identification", all = TRUE, sort = TRUE)

#Remove the missing data for job hours
dataMiss<-NDFinal[which(NDFinal$jobhrs!='NA'), ]

#Variable for people who have a job or get financial aid = 1
dataMiss$jobnaid<-0

dataMiss$jobnaid[(dataMiss$job==1  |dataMiss$finaid==1) & dataMiss$jobnaid==0]<-1

# for people who do not have a job or get financial aid = 0
dataMiss$jobnaid[(dataMiss$job==2|dataMiss$finaid==2)]<-0
table(dataMiss$jobnaid)

#make a dataframe consisting only of people taking three or more courses
dfc<-dataMiss[which(dataMiss$courses.x >= 3 & dataMiss$courses.y >= 3 ), ]
table(dfc)

table(dfc$year)
#find the people in dataframe dfc who are graduating in 2018
#get2018<-dfc[which(dfc$year == 2018), ]
#print the people who are graduating in 2018
#print(get2018)

