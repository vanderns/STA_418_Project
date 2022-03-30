library(deldir)
library(sp)
de <- deldir(df$Lon,df$Lat)
de$summary

get_area <- function(df){
  areas <- deldir(df$Lon,df$Lat)$summary$dir.area
  return(areas)
}

get_area(df)

get_polygons <- function(df){
  tiles <- deldir(df$Lon, df$Lat) %>% 
    tile.list
  len <- seq_along(tiles)
  vari<- paste0("tiles$pt.",len,"$x")
  var <- vector()
  for (i in seq_along(vari)){
    var[[i]] <- parse(text=vari[[i]])
  }
  return(var)
}
paste0("tiles$pt.",1:len,"$x")
seq_along(tile.list(deldir(df$Lon, df$Lat)))
(get_polygons(df))[2]
tiles <- deldir(df$Lon, df$Lat) %>% 
  tile.list
len <- seq_along(tiles)
len
seq_along(tiles[1])
v <- 1
tiles[1]
point.in.polygon(tiles[1]$pt.1$pt[1],tiles[1]$pt.1$pt[2],tiles[1]$pt.1$x,tiles[1]$pt.1$y)
