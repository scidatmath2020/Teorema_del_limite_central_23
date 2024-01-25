library(tidyverse)

# Definimos una población de tamaño 10000 tomado de una normal
# con media 1.7 y desviación 0.2

mi_poblacion = rnorm(10000,mean=1.7,sd=0.2)

# De la población anterior, tomamos 1000 muestras de tamaño 20 y sumamos
# los 20 valores de cada una de las 1000 muestras, de modo que obtenemos
# 1000 sumas. Al arreglo de 1000 sumas lo llamamos suma


sumas = replicate(1000,sum(mi_poblacion[sample(1:10000,20)]))

# Convertimos los resultados anteriores a una tabla llamada mi_data 
# de 1000 filas y una columna llamada sumas 

mi_data = data.frame(sumas=sumas)

# Graficamos el histograma de frecuencias relativas

ggplot()+
  geom_histogram(data = mi_data,
                 mapping = aes(x=sumas,y=after_stat(density)),
                 color = "blue",
                 fill = "darkblue")

# Para cada número de 31, 31.1, 31.2, 31.3,..., 36.8, 36.9, 37, calculamos
# f(x) donde f es la densidad de una N(media=20*1.7,sd= sqrt(20*0.2^2))

gaussiana_verdadera = data.frame(abscisas = seq(31,37,by=0.1),
                                 ordenadas = dnorm(seq(31,37,by=0.1),
                                                   20*1.7,
                                                   sqrt(20*0.2^2)))

# Graficamos el histograma anterior junto con la campana correspondiente
# a una N(media=20*1.7,sd= sqrt(20*0.2^2))

ggplot()+
  geom_histogram(data = mi_data,
                 mapping = aes(x=sumas,y=after_stat(density)),
                 color = "blue",
                 fill = "darkblue") +
  geom_line(data = gaussiana_verdadera,
            mapping = aes(x=abscisas,y=ordenadas),
            color = "red")








