<<<<<<< HEAD
sep_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Sep21.csv")
oct_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Oct21.csv")
nov_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Nov21.csv")
dec_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Dec21.csv")
jan_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Jan22.csv")
feb_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Feb22.csv")
#Combining all the data
uber_data <- rbind(sep_data,oct_data,nov_data,dec_data,jan_data,feb_data)
head(jan_data)
=======
#Data Analysis using UBER DATASET
#Source: Last 6 months Uber data sets
#Asking Questions from Data and finding graphs
#Import all the files and library 

library(ggplot2)  #Visualization/create complex plots from data in a data frame
library(ggthemes) #provides extra themes, geoms, and scales for the ggplot2 package
library(dplyr)    #provides a set of tools for efficiently manipulating datasets
library(lubridate)#makes it easier to work with dates and times
library(scales)   #used for graphical scaling 
library(tidyr)    #tidy data  
library(DT)       #tabled formatted result

getwd()
#Reading the chunk of data
#for fast reading data we can also use:
#library(data.table)
#data3 <- fread("C:\\Users\\Bob\\Desktop\\data.csv")

#library(readr)
#data2 <- read_csv("C:\\Users\\Bob\\Desktop\\data.csv")

#sep_data <- read.csv("~/STA 518/website/Project/datasets/uber-raw-data-Sep21.csv")
sep_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Sep21.csv")
oct_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Sep21.csv")
nov_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Sep21.csv")
dec_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Sep21.csv")
jan_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Sep21.csv")
feb_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Sep21.csv")

#Combining all the data
uber_data <- rbind(sep_data,oct_data,nov_data,dec_data,jan_data,feb_data)

#Visualize the data
head(uber_data)

#Structure
str(uber_data)

>>>>>>> 50f9f02d966ebd0a4f5fb1e9eff2d980c2c16484
#primary observations from date time 
#lat long data from USA cities
#they have 5 bases 

#analysis
<<<<<<< HEAD
uber_data <- uber_data %>% 
  mutate(Date.Time=parse_date_time(`Date.Time`,"%m/%d/%Y %H:%M")) %>% 
  mutate(day=day(Date.Time),month=month(Date.Time),year=year(Date.Time),dayofweek=wday(Date.Time),hour=hour(Date.Time),minute=minute(Date.Time))

=======

uber_data$Date.Time <- as.POSIXct(uber_data$Date.Time, format = "%m/%d/%Y %H:%M:%S")

#summary Statistics
summary(uber_data)
#Extracting time from date time
#uber_data$Time <- format(as.POSIXct(uber_data$Date.Time, format = "%m/%d/%Y %H:%M"), format = "%H:%M")
uber_data <- uber_data %>%
  mutate(Date.Time=parse_date_time(`Date.Time`,"%m/%d/%Y %H:%M")) %>%
  mutate(day=day(Date.Time),month=month(Date.Time),year=year(Date.Time),dayofweek=wday(Date.Time))
#confirm
#mutate(uber_data = parse_date_time(`Date/Time`,"%m/%d/%Y %H:%M"))
uber_data$Time

uber_data$Date.Time <- ymd_hms(uber_data$Date.Time) #formatting time
uber_data$day <- format(day(uber_data$Data.Time))#days
uber_data$month <- format(day(uber_data$Data.Time, label = TRUE)) #month
uber_data$year <- format(year(uber_data$Data.Time))
uber_data$dayofweek <- format(weekday(uber_data$Data.Time, label = TRUE)) #dayofweek
head(uber_data)

#hour minute seconds

uber_data$hour <- factor(hour(hms(uber_data$Time))) #to get all factors
uber_data$minute <- factor(minute(hms(uber_data$Time)))
uber_data$second <- factor(second(hms(uber_data$Time)))
head(uber_data)

>>>>>>> 50f9f02d966ebd0a4f5fb1e9eff2d980c2c16484
#visualization of data
#plotting the trip by hours in a day

hour_data <- uber_data %>%
  group_by(hour) %>%
  summarise(Total=n())  #grouping data wrt hour and count

#checking in a tabular form
<<<<<<< HEAD
=======
datatable(hour_data)


>>>>>>> 50f9f02d966ebd0a4f5fb1e9eff2d980c2c16484
#visualize the data

ggplot(hour_data, aes(hour,Total)) +
  geom_bar(stat = "identity", fill = "black", color = "blue")+
  ggtitle("Trips by Hour")+
  theme(legend.position = "none")+
  scale_y_continuous(labels = comma)

#most operations happens during 15 to 21 hours aka 3pm to 9pm

month_hour_data <- uber_data %>%
  group_by(month,hour) %>%
  summarise(Total=n())

<<<<<<< HEAD
=======
#checking in a tabular form
datatable(month_hour_data)
>>>>>>> 50f9f02d966ebd0a4f5fb1e9eff2d980c2c16484

#ploting the graphs
ggplot(month_hour_data, aes(hour,Total, fill=month)) +
  geom_bar(stat = "identity")+
  ggtitle("Trips by Hour and Month")+
  scale_y_continuous(labels = comma)

#finding from the graph says September has more rides than other months

sept_hour <- uber_data %>%
  group_by(hour, month) %>%
  filter(month == "sep") %>%
  summarise(Total = n())

ggplot(sept_hour, aes(hour,Total, fill=hour)) +
  geom_bar(stat = "identity")+
  ggtitle("Trips by Hour and Month for September")+
  scale_y_continuous(labels = comma)
#if possible we can also find trends for other months

#plotting data grouped by day

day_data <- uber_data %>%
  group_by(day) %>%
  summarise(Total = n()) #grouping data wrt hour and count

#check in tabular form
datatable(day_data)

#we can find out trips by day
#find out trips per month
<<<<<<< HEAD
library(ggthemes)
min_lat <- min(uber_data$Lat,na.rm =TRUE)
max_lat <- max(uber_data$Lat,na.rm =TRUE)
min_long <- min(uber_data$Lon,na.rm =TRUE)
max_long <- max(uber_data$Lon,na.rm =TRUE)
ggplot(uber_data, aes(x=Lon, y=Lat, color = Base)) +
  geom_point(size=1)+
  ggmap(get_map(location=c(-73,41),maptype='roadmap'))+
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2021-22 BY BASE")

attr(get_map(location=c((max_long+min_long)/2,(max_lat+min_lat)/2),maptype='roadmap'),'bb')

ggmap(get_map(location=c((max_long+min_long)/2,(max_lat+min_lat)/2),maptype='roadmap')) +
  geom_point(uber_data, mapping=aes(x=Lon, y=Lat, color = Base))+
=======

#feb data

feb_hour <- uber_data %>%
  group_by(day,month) %>%
  filter(month == "feb") %>%
  summarise(Total = n())
ggplot(sept_day, aes(day,Total, fill=day)) +
  geom_bar(stat = "identity") +
  ggtitle("Trips by day and month for feb") +
  scale_y_continuous(lables = comma)
#found which day has highest number of rides

#monthly trend

month_data <- uber_data %>% group_by(month) %>% summarise(Total = n())
datatable(month_data)

ggplot(month_data, aes(month,Total,fill=month))+
  geom_bar(stat = "identity") +
  ggtitle("Trips By month") +
  scale_y_continuous(labels = comma)

#month-weekday
month_weekday_data <- uber_data %>% group_by(month,dayofweek) %>% summarise(Total = n())
datatable(month_weekday_data)

ggplot(month_weekday_data, aes(month, Total, fill=dayofweek))+
  geom_bar(stat = "identity") +
  ggtitle("Trips by month and weekday") +
  scale_y_continuous(label = comma)

#checking only for weekday
weekday_data <- uber_data %>% group_by(dayofweek) %>% summarise(Total = n())
datatable(weekday_data)

ggplot(weekday_data, aes(dayofweek, Total, fill=dayofweek))+
  geom_bar(stat = "identity") +
  ggtitle("Trips by weekday") +
  scale_y_continuous(label = comma)

#analysis of bases

ggplot(uber_data, aes(Base)) +
  geom_bar(fill = "darkred") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases")

#trip based on bases and months
ggplot(uber_data, aes(Base, fill = month)) +
  geom_bar(position = "dodge") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases and month")

#same with days of week
ggplot(uber_data, aes(Base, fill = dayofweek)) +
  geom_bar(position = "dodge") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases and Dayofweek")

#plotting heatmap for day and hour
day_and_hour <- uber_data %>%
  group_by(day, hour) %>%
  dplyr::summarise(Total = n())
datatable(day_and_hour)

ggplot(day_and_hour, aes(day, hour, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Hour and Day")

#plotting a geo distribution
#summary(uber_data)
min_lat <- 40.07
max_lat <- 42.12
min_long <- -74.77
max_long <- -72.07
ggplot(uber_data, aes(x=Lon, Y=Lat, color = Base)) +
  geom_point(size=1)+
>>>>>>> 50f9f02d966ebd0a4f5fb1e9eff2d980c2c16484
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2021-22 BY BASE")

<<<<<<< HEAD
ggmap(get_map(location=c((max_long+min_long)/2,(max_lat+min_lat)/2),maptype='roadmap')) +
  geom_point(uber_data, mapping=aes(x=Lon, y=Lat, color = Base))+
  scale_x_continuous(limits=c(-73.9, -73.1)) +
  scale_y_continuous(limits=c(40.6, 41.2)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2021-22 BY BASE")

month_data <- uber_data %>% group_by(month) %>% summarise(Total = n())

ggplot(month_data, aes(month,Total,fill=month))+
  geom_bar(stat = "identity") +
  ggtitle("Trips By month")
=======


>>>>>>> 50f9f02d966ebd0a4f5fb1e9eff2d980c2c16484
