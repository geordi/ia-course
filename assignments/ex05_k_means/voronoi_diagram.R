library(ggplot2)
library(ggvoronoi)
#set.seed(45056)
#x <- c(0.111,0.715,0.167,0.155,0.758,0.215,0.151,0.725,0.219,0.153,0.707,0.220)
#y <- c(0.935,0.924,0.079,0.958,0.964,0.081,0.960,0.935,0.075,0.955,0.913,0.078)

x <- c(0.111,0.715,0.167)
y <- c(0.935,0.924,0.079)

#0.111, 0.935), (0.155, 0.958), (0.151, 0.960), (0.153, 0.955),
#(0.715, 0.924), (0.758, 0.964), (0.725, 0.935), (0.707, 0.913),
#(0.167, 0.079), (0.215, 0.081), (0.219, 0.075), (0.220, 0.078)

points <- data.frame(x, y,
                     distance = sqrt((x-100)^2 + (y-100)^2))
#circle <- data.frame(x = 100*(1+cos(seq(0, 2*pi, length.out = 2500))),
#                     y = 100*(1+sin(seq(0, 2*pi, length.out = 2500))),
#                     group = rep(1,2500))

#ggplot(points) +
#  geom_point(aes(x,y,color=distance)) +
#  geom_path(data=circle,aes(x,y,group=group))

#ggplot(points) +
#  geom_voronoi(aes(x,y,fill=distance)) +
#  geom_point(aes(x,y))


ggplot(points,aes(x,y)) +
  stat_voronoi(geom="path") +
  geom_point()