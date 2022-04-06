df <- read_csv(here::here('Uber-dataset','uber-raw-data-Feb22.csv'))
df <- slice_sample(df, n=5)
ggplot(data=df,aes(x=Lon,y=Lat))+
  geom_path(stat="voronoi",alpha=.6) +
  geom_point(color="red",alpha=.6)

tiles <- deldir(df$Lon, df$Lat) %>% 
  tile.list
unlist(get_poly_x(df)[1])
max(unlist(get_poly_x(df)))

coords <- get_coords(get_poly_x(df),get_poly_y(df))

get_coords <- function(x_vals,y_vals){
  xs <- c()
  ys <- c()
  for (i in seq_along(x_vals)){
    for (j in seq_along(unlist(x_vals[i]))){
      xs <- append(xs,unlist(x_vals[i])[j])
      ys <- append(ys,unlist(y_vals[i])[j])
    }
  }
  return(c((max(xs)+min(xs))/2,(max(ys)+min(ys))/2,max(xs),min(xs),max(ys),min(ys)))
}

nymap <- get_map(location=coords[1:2],maptype='roadmap')
ggmap(nymap)+
  xlim(coords[4],coords[3])+ylim(coords[6],coords[5])+
  geom_path(data=df,aes(x=Lon,y=Lat),stat="voronoi",alpha=.6) +
  geom_point(data=df,aes(x=Lon,y=Lat),color="red",alpha=.6)

nymap <- openmap(coords[1:2],coords[3:4], zoom = 10,
        type = "opencyclemap", mergeTiles = TRUE)
nymap2 <- openproj(nymap)

nymap2_plt <- OpenStreetMap::autoplot.OpenStreetMap(nymap2) + 
  geom_path(data=df,aes(x=Lon,y=Lat),stat="voronoi",alpha=.6) +
  geom_point(data=df,aes(x=Lon,y=Lat),color="red",alpha=.6)

nymap2_plt
