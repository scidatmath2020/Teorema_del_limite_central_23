# -*- coding: utf-8 -*-
"""
Created on Thu Jan 25 09:07:11 2024

@author: Usuario
"""
import scipy
from random import sample
import pandas as pd
import numpy as np
from plotnine import *

#%%

''' Definimos una población de tamaño 10000 tomado de una normal
    con media 1.7 y desviación 0.2'''

tamano_poblacion = 10000
mi_poblacion = np.random.normal(loc=1.7,scale=0.2,size=tamano_poblacion)

#%%
''' De la población anterior, tomamos 1000 muestras de tamaño 20 y sumamos
    los 20 valores de cada una de las 1000 muestras, de modo que obtenemos
    1000 sumas. Al arreglo de 1000 sumas lo llamamos suma'''

tamano_muestra = 20
sumas = [sum(mi_poblacion[sample(range(10000),tamano_muestra)]) for x in range(1000)]

''' Convertimos los resultados anteriores a una tabla llamada mi_data 
    de 1000 filas y una columna llamada sumas '''


mi_data = pd.DataFrame({"sumas":sumas})

'''Graficamos el histograma de frecuencias relativas'''

(
ggplot()+
  geom_histogram(data = mi_data,
                 mapping = aes(x="sumas",y=after_stat("density")),
                 color = "blue",
                 fill = "darkblue")
)

#%%

''' Para cada número de desde la menor suma hasta la mayor suma, saltando
    de 0.01 en 0.01, calculamos f(x) donde f es la densidad de una 
    N(media=20*1.7,sd= sqrt(20*0.2^2))'''

a = mi_data.sumas.min()
b = mi_data.sumas.max()

gaussiana_verdadera = {"abscisas":np.arange(a,b+0.01,0.01),
                       "ordenadas":scipy.stats.norm.pdf(np.arange(a,b+0.01,0.01),
                                                        loc=tamano_muestra*1.7,
                                                        scale=(tamano_muestra*0.2**2)**0.5 )}

gaussiana_verdadera = pd.DataFrame(gaussiana_verdadera)

''' Graficamos el histograma anterior junto con la campana correspondiente
    a una N(media=20*1.7,sd= sqrt(20*0.2^2))'''

(
ggplot()+
  geom_histogram(data = mi_data,
                 mapping = aes(x="sumas",y=after_stat("density")),
                 color = "blue",
                 fill = "darkblue") +
  geom_line(data = gaussiana_verdadera,
            mapping = aes(x="abscisas",y="ordenadas"),
            color = "red")
)