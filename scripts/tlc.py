# -*- coding: utf-8 -*-
"""
Created on Fri Jan 26 19:04:10 2024

@author: Usuario
"""

import os
import pandas as pd
import numpy as np
from plotnine import *
import random
import scipy

#%%

os.chdir("C:\\Users\\Usuario\\Documents\\scidata\\24_tlc")

mis_datos = pd.read_csv("edades.csv")

(
ggplot()+
  geom_histogram(data=mis_datos,
                 mapping = aes(x="edad_2024",
                                 y=after_stat("density"))) 
 
)

promedios = pd.DataFrame({"prom_edad":[np.mean(random.sample(list(mis_datos.edad_2024),30)) for x in range(1000)]})

(
ggplot()+
  geom_histogram(data=mis_datos,
                 mapping = aes(x="edad_2024",
                               y=after_stat("density")),
                 color = "yellow",
                 fill = "yellow") +
  geom_histogram(data=promedios,
                 mapping = aes(x="prom_edad",
                               y=after_stat("density")),
                 color = "red",
                 fill = "red",
                 alpha=0.5)
)

N = mis_datos.shape[0]
n = 30

media = np.mean(mis_datos.edad_2024)
desv = mis_datos.edad_2024.std()/n**0.5


normal_verdadera = pd.DataFrame({"abscisas":np.arange(20,60+0.1,0.1),
                              "ordenadas":scipy.stats.norm.pdf(np.arange(20,60+0.1,0.1),
                                                 loc=media,
                                                 scale =desv)})

(
ggplot()+
  geom_histogram(data=mis_datos,
                 mapping = aes(x="edad_2024",
                               y=after_stat("density")),
                 color = "yellow",
                 fill = "yellow") +
  geom_histogram(data=promedios,
                 mapping = aes(x="prom_edad",
                               y=after_stat("density")),
                 color = "red",
                 fill = "red",
                 alpha=0.5) +
  geom_line(data = normal_verdadera,
            mapping = aes(x="abscisas",y="ordenadas"),
            color = "darkblue")

)