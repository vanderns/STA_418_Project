sep_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Sep21.csv")
oct_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Oct21.csv")
nov_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Nov21.csv")
dec_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Dec21.csv")
jan_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Jan22.csv")
feb_data <- read.csv("https://raw.githubusercontent.com/vanderns/STA_418_Project/main/Uber-dataset/uber-raw-data-Feb22.csv")
#Combining all the data
uber_data <- rbind(sep_data,oct_data,nov_data,dec_data,jan_data,feb_data)
head(jan_data)
#primary observations from date time 
#lat long data from USA cities
#they have 5 bases 
#analysis
uber_data <- uber_data %>% 
  mutate(Date.Time=parse_date_time(`Date.Time`,"%m/%d/%Y %H:%M")) %>% 
  mutate(day=day(Date.Time),month=month(Date.Time),year=year(Date.Time),dayofweek=wday(Date.Time),hour=hour(Date.Time),minute=minute(Date.Time))

#visualization of data
#plotting the trip by hours in a day
hour_data <- uber_data %>%
  group_by(hour) %>%
  summarise(Total=n())  #grouping data wrt hour and count
#checking in a tabular form
#visualize the data
ggplot(hour_data, aes(hour,Total)) +
  geom_bar(stat = "identity", fill = "black", color = "blue")+
  ggtitle("Trips by Hour")+
  theme(legend.position = "none")
#most operations happens during 15 to 21 hours aka 3pm to 9pm
month_hour_data <- uber_data %>%
  group_by(month,hour) %>%
  summarise(Total=n())


#ploting the graphs
ggplot(month_hour_data, aes(hour,Total, fill=month)) +
  geom_bar(stat = "identity")+
  ggtitle("Trips by Hour and Month")
#finding from the graph says September has more rides than other months
sept_hour <- uber_data %>%
  group_by(hour, month) %>%
  filter(month == 9) %>%
  summarise(Total = n())
ggplot(sept_hour, aes(hour,Total, fill=hour)) +
  geom_bar(stat = "identity")+
  ggtitle("Trips by Hour and Month for September")
#if possible we can also find trends for other months
#plotting data grouped by day
day_data <- uber_data %>%
  group_by(day) %>%
  summarise(Total = n()) #grouping data wrt hour and count
#check in tabular form
datatable(day_data)
#we can find out trips by day
#find out trips per month
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
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2021-22 BY BASE")

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
