df <- read_csv(here::here('Uber-dataset','uber-raw-data-Sep21.csv'))
data2 <- slice_sample(df, n=5)
tiles <- deldir(data2$Lon, data2$Lat) %>% 
  tile.list
coords <- get_coords(get_poly_x(data2), get_poly_y(data2))
generate_voronoi(data2)
get_area(data2)
find_pt(get_poly_x(data2), get_poly_y(data2), slice_sample(df, n=25)) %>% 
  create_choro()

df <- read_csv(here::here('Uber-dataset','uber-raw-data-Sep21.csv'))
data25 <- slice_sample(df, n=25)
tiles <- deldir(data25$Lon, data25$Lat) %>% 
  tile.list
coords <- get_coords(get_poly_x(data25), get_poly_y(data25))
generate_voronoi(data25)
get_area(data25)
find_pt(get_poly_x(data25), get_poly_y(data25), slice_sample(df, n=2500)) %>% 
  create_choro()

df <- read_csv(here::here('Uber-dataset','uber-raw-data-Sep21.csv'))
data100 <- slice_sample(df, n=100)
tiles <- deldir(data100$Lon, data100$Lat) %>% 
  tile.list
coords <- get_coords(get_poly_x(data100), get_poly_y(data100))
generate_voronoi(data100)
get_area(data100)
find_pt(get_poly_x(data100), get_poly_y(data100), slice_sample(df, n=500)) %>% 
  create_choro()

plotting <- data.frame(area=sort(get_area(data100),decreasing=TRUE),region=seq_along(get_area(data100)))
ggplot(data=plotting, mapping=aes(x=region,y=area,fill=area)) +
  geom_col()

generate_voronoi(data25)
coords <- c(-73.97045, 40.72370, -73.71539, -74.22551, 40.81814, 40.62926)

df <- read_csv(here::here('Uber-dataset','uber-raw-data-Oct21.csv'))
odata <- slice_sample(df, n=25)
tiles <- deldir(odata$Lon, odata$Lat) %>% 
  tile.list
coords <- get_coords(get_poly_x(odata), get_poly_y(odata))
generate_voronoi(odata)
get_area(odata)
find_pt(get_poly_x(odata), get_poly_y(odata), slice_sample(df, n=50)) %>% 
  create_choro()

df <- read_csv(here::here('Uber-dataset','uber-raw-data-Nov21.csv'))
ndata <- slice_sample(df, n=25)
tiles <- deldir(ndata$Lon, ndata$Lat) %>% 
  tile.list
coords <- get_coords(get_poly_x(ndata), get_poly_y(ndata))
generate_voronoi(ndata)
get_area(ndata)
find_pt(get_poly_x(ndata), get_poly_y(ndata), slice_sample(df, n=2500)) %>% 
  create_choro()

df <- read_csv(here::here('Uber-dataset','uber-raw-data-Dec21.csv'))
ddata <- slice_sample(df, n=25)
tiles <- deldir(ddata$Lon, ddata$Lat) %>% 
  tile.list
coords <- get_coords(get_poly_x(ddata), get_poly_y(ddata))
generate_voronoi(ddata)
get_area(ddata)
find_pt(get_poly_x(ddata), get_poly_y(ddata), slice_sample(df, n=50)) %>% 
  create_choro()

df <- read_csv(here::here('Uber-dataset','uber-raw-data-Jan22.csv'))
jdata <- slice_sample(df, n=25)
tiles <- deldir(jdata$Lon, jdata$Lat) %>% 
  tile.list
coords <- get_coords(get_poly_x(jdata), get_poly_y(jdata))
generate_voronoi(jdata)
get_area(jdata)
find_pt(get_poly_x(jdata), get_poly_y(jdata), slice_sample(df, n=2500)) %>% 
  create_choro()

df <- read_csv(here::here('Uber-dataset','uber-raw-data-Feb22.csv'))
fdata <- slice_sample(df, n=25)
tiles <- deldir(fdata$Lon, fdata$Lat) %>% 
  tile.list
coords <- get_coords(get_poly_x(fdata), get_poly_y(fdata))
generate_voronoi(fdata)
get_area(fdata)
find_pt(get_poly_x(fdata), get_poly_y(fdata), slice_sample(df, n=1000)) %>% 
  create_choro()