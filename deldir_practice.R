library(deldir)
library(sp)
de <- deldir(df$Lon,df$Lat)
de$summary

get_area <- function(df){
  areas <- deldir(df$Lon,df$Lat)$summary$dir.area
  return(areas)
}

get_area(df)

evparse <- function(x){
  eval(parse(text = paste0(x)))
}

temp_vec <- paste0("tiles$pt.", len, "$x")
temp_vec

map(temp_vec, evparse)

get_poly_x <- function(df){
  tiles <- deldir(df$Lon, df$Lat) %>% 
    tile.list
  len <- seq_along(tiles)
  temp_vec <- paste0("tiles$pt.", len, "$x")
  return(map(temp_vec, evparse))
}

get_poly_y <- function(df){
  tiles <- deldir(df$Lon, df$Lat) %>% 
    tile.list
  len <- seq_along(tiles)
  temp_vec <- paste0("tiles$pt.", len, "$y")
  var <- vector()
  return(map(temp_vec, evparse))
} 

find_pt <- function(xvals,yvals,df){
  ex <- data.frame()
  for (i in seq_along(xvals)){
    frame=data.frame(I(list(xvals[i])),I(list(yvals[i])))
    names(frame) = c("x_vals","y_vals")
    ex <- rbind(ex, frame)
  }
  ex <- mutate(ex,count=0)
  for (i in seq_along(df$Lat)){
    for (j in seq_along(ex$x_vals)){
      if (point.in.polygon(df$Lon[i],df$Lat[i],unlist(ex$x_vals[j]),unlist(ex$y_vals[j])) > 0){
        ex$count[j] <- ex$count[j] + 1
      }
    }
  }
  return(ex)
}

data <- find_pt(xvals,yvals,df)
df

create_choro <- function(df){
  ids <- seq_along(df$count)
  id=c()
  for (i in seq_along(df$count)){
    id <- append(id,rep(ids[i], each=length(unlist(df$x_vals[i]))))
  }
  value=c()
  for (i in seq_along(df$count)){
    value <- append(value,rep(df$count[i], each=length(unlist(df$x_vals[i]))))
  }
  xs <- c()
  for (i in seq_along(df$count)){
    for (j in seq_along(unlist(df$x_vals[i]))){
      xs <- append(xs,unlist(df$x_vals[i])[j])
    }
  }
  ys <- c()
  for (i in seq_along(df$count)){
    for (j in seq_along(unlist(df$y_vals[i]))){
      ys <- append(ys,unlist(df$y_vals[i])[j])
    }
  }
  data <- data.frame(group=id,Count=value,x=xs,y=ys)
  p <- ggplot(data, aes(x = x, y = y)) +
    geom_polygon(aes(fill = Count, group = group, alpha=.5))
  return(p)
}

data$count <- 1:5

create_choro(data)

typeof((data$x_vals[2])[[1]])
unlist(data$x_vals[2])[1]
x <- c()
for (i in seq_along(data$count)){
  for (j in seq_along(unlist(data$x_vals[i]))){
    x <- append(x,unlist(data$x_vals[i])[j])}}

id=c()
for (i in seq_along(data$count)){
  id <- append(id,rep(i, each=length(unlist(data$x_vals[i]))))
}

append(x,-73.88644)
x

ggplot() +
  geom_polygon(data=data, mapping=aes(fill=count, x=x_vals, y=y_vals,group=count))

ggplot() +
  geom_point(data=data, mapping=aes(x=unlist(x_vals), y=unlist(y_vals)))

for (i in seq_along(df)){
  for (j in seq_along(ex)){
    print(point.in.polygon(df$Lon[i],df$Lat[i],ex$x_vals[j],ex$y_vals[j]))
    if (point.in.polygon(df$Lon[i],df$Lat[i],ex$x_vals[j],ex$y_vals[j]) > 0){
      ex$count[j] <- ex$count[j] + 1
    }
  }
}
point.in.polygon(df$Lon[1],df$Lat[1],unlist(ex$x_vals[1]),unlist(ex$y_vals[1]))

point.in.polygon(df$Lon[1],df$Lat[1],c(-73.88644, -74.05499, -74.05499, -73.90948),c(40.70104, 40.76720, 40.63065, 40.63065))
typeof(unlist(ex$x_vals[1]))

paste0("tiles$pt.",len,"$x")1:5
seq_along(tile.list(deldir(df$Lon, df$Lat)))
(get_poly_x(df))
(get_poly_y(df))
tiles <- deldir(df$Lon, df$Lat) %>% 
  tile.list
len <- seq_along(tiles)
len
seq_along(tiles[1])
v <- 1
tiles[1]
point.in.polygon(-73.88645,40.70105,tiles[1]$pt.1$x,tiles[1]$pt.1$y)
plot(tiles, pch = 19)

xvals <- get_poly_x(df)
yvals <- get_poly_y(df)
as.data.frame(xvals,yvals)
ex <- data.frame(x_vals=I(list(get_poly_x(df))),y_vals=I(list(get_poly_y(df))))
get_poly_x(df)[[2]]
ex <- data.frame()
for (i in seq_along(xvals)){
  frame=data.frame(I(list(xvals[i])),I(list(yvals[i])))
  print(xvals[i])
  names(frame) = c("x_vals","y_vals")
  ex <- rbind(ex, frame)
}
mutate(ex,count=0)
