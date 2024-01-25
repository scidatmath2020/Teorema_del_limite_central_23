library(tidyverse)

mi_poblacion = rnorm(10000,mean=1.7,sd=0.2)

sumas = replicate(1000,sum(mi_poblacion[sample(1:10000,20)]))

mi_data = data.frame(sumas=sumas)

ggplot()+
  geom_histogram(data = mi_data,
                 mapping = aes(x=sumas,y=after_stat(density)),
                 color = "blue",
                 fill = "darkblue")

gaussiana_verdadera = data.frame(abscisas = seq(31,37,by=0.1),
                                 ordenadas = dnorm(seq(31,37,by=0.1),
                                                   20*1.7,
                                                   sqrt(20*0.2^2)))

ggplot()+
  geom_histogram(data = mi_data,
                 mapping = aes(x=sumas,y=after_stat(density)),
                 color = "blue",
                 fill = "darkblue") +
  geom_line(data = gaussiana_verdadera,
            mapping = aes(x=abscisas,y=ordenadas),
            color = "red")








