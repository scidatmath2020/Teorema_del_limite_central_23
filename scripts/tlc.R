library(tidyverse)

setwd("C:\\Users\\Usuario\\Documents\\scidata\\24_tlc")

mis_datos = read.csv("edades.csv")

ggplot()+
  geom_histogram(data=mis_datos,
                 mapping = aes(x=edad_2024,
                                 y=after_stat(density)))

# el tamaño de la muestra es 30

promedios = data.frame("prom_edad"=replicate(1000,
                                             mean(sample(mis_datos$edad_2024,30))))

ggplot()+
  geom_histogram(data=mis_datos,
                 mapping = aes(x=edad_2024,
                               y=after_stat(density)),
                 color = "yellow",
                 fill = "yellow") +
  geom_histogram(data=promedios,
                 mapping = aes(x=prom_edad,
                               y=after_stat(density)),
                 color = "red",
                 fill = "red",
                 alpha=0.5)

####  mu = media de la población
#### sd = sigma / sqrt(n) = desviacion de la poblacion / sqrt(n)

N = nrow(mis_datos)
n = 30

media = mean(mis_datos$edad_2024)
desv = sd(mis_datos$edad_2024)*sqrt((N-1)/N)/sqrt(n)

normal_verdadera = data.frame("abscisas"=seq(20,60,0.1),
                              "ordenadas"=dnorm(seq(20,60,0.1),
                                                 mean=media,
                                                 sd =desv))


ggplot()+
  geom_histogram(data=mis_datos,
                 mapping = aes(x=edad_2024,
                               y=after_stat(density)),
                 color = "yellow",
                 fill = "yellow") +
  geom_histogram(data=promedios,
                 mapping = aes(x=prom_edad,
                               y=after_stat(density)),
                 color = "red",
                 fill = "red",
                 alpha=0.5) +
  geom_line(data = normal_verdadera,
            mapping = aes(x=abscisas,y=ordenadas),
            color = "darkblue")


poblacion = data.frame("X"=c(94, 	11, 	35, 	58, 	60, 	49, 	75, 	44, 	18, 	22, 	62, 	47, 	64, 	36, 	55, 	47, 	29, 	71, 	56, 	78, 	40, 	65, 	12, 	86, 	63, 	11, 	36, 	73, 	74, 	28, 	94, 	79, 	56, 	60, 	63, 	37, 	65, 	53, 	44, 	72, 	15, 	11, 	76, 	85, 	34, 	93, 	100, 	100, 	82, 	58, 	78, 	75, 	30, 	48, 	40, 	44, 	73, 	75, 	57, 	41, 	18, 	93, 	14, 	62, 	63, 	81, 	44, 	63, 	55, 	55, 	98, 	59, 	47, 	65, 	33, 	14, 	86, 	33, 	28, 	94, 	57, 	40, 	87, 	78, 	80, 	10, 	34, 	12, 	82, 	86, 	33, 	46, 	83, 	40, 	16, 	90, 	33, 	23, 	67, 	43, 	14, 	28, 	76, 	21, 	56, 	59, 	83, 	55, 	69, 	67, 	63, 	35, 	94, 	62, 	12, 	74, 	100, 	53, 	75, 	65, 	16, 	33, 	74, 	17, 	18, 	77, 	74, 	57, 	54, 	16, 	46, 	28, 	67, 	97, 	88, 	51, 	75, 	38, 	63, 	60, 	70, 	96, 	88, 	82, 	13, 	83, 	99, 	93, 	63, 	28, 	28, 	85, 	52, 	42, 	30, 	61, 	26, 	95, 	14, 	86, 	30, 	57, 	78, 	92, 	61, 	42, 	13, 	74, 	90, 	38, 	87, 	44, 	82, 	28, 	42, 	72, 	42, 	44, 	50, 	43, 	35))

ggplot()+
  geom_histogram(data=poblacion,
                 mapping = aes(x=X,
                               y=after_stat(density)),
                 color = "yellow",
                 fill = "yellow")

promedio_numeros = data.frame("prom" = replicate(1000,
                                                 mean(sample(poblacion$X,150))))

ggplot()+
  geom_histogram(data=poblacion,
                 mapping = aes(x=X,
                               y=after_stat(density)),
                 color = "yellow",
                 fill = "yellow") +
  geom_histogram(data=promedio_numeros,
                 mapping = aes(x=prom,
                               y=after_stat(density)),
                 color = "red",
                 fill = "red",
                 alpha=0.5) 

N = nrow(poblacion)
n = 10

media = mean(poblacion$X)
desv = sd(poblacion$X)*sqrt((N-1)/N)/sqrt(n)

normal_numeros = data.frame("abscisas"=seq(25,75,0.1),
                              "ordenadas"=dnorm(seq(25,75,0.1),
                                                mean=media,
                                                sd =desv))

ggplot()+
  geom_histogram(data=poblacion,
                 mapping = aes(x=X,
                               y=after_stat(density)),
                 color = "yellow",
                 fill = "yellow") +
  geom_histogram(data=promedio_numeros,
                 mapping = aes(x=prom,
                               y=after_stat(density)),
                 color = "red",
                 fill = "red",
                 alpha=0.5) +
  geom_line(data = normal_numeros,
            mapping = aes(x=abscisas,y=ordenadas),
            color = "darkblue")


binomial = data.frame("valor"=rbinom(150,10,0.5))

ggplot() +
  geom_histogram(data=binomial,
                 mapping = aes(x=valor,y=after_stat(density)),
                 color = "yellow",
                 fill = "yellow")

promedio_binomial = data.frame("prom" = replicate(100,
                                                 mean(sample(binomial$valor,10))))


ggplot() +
  geom_histogram(data=binomial,
                 mapping = aes(x=valor,y=after_stat(density)),
                 color = "yellow",
                 fill = "yellow") +
  geom_histogram(data=promedio_binomial,
                 mapping = aes(x=prom,y=after_stat(density)),
                 color = "red",
                 fill = "red")