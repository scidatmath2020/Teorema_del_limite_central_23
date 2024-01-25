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

mi_poblacion = np.random.normal(loc=1.7,scale=0.2,size=10000)
sumas = [sum(mi_poblacion[sample(range(10000),20)]) for x in range(1000)]

mi_data = pd.DataFrame({"sumas":sumas})

(
ggplot()+
  geom_histogram(data = mi_data,
                 mapping = aes(x="sumas",y=after_stat("density")),
                 color = "blue",
                 fill = "darkblue")
)

#%%

gaussiana_verdadera = {"abscisas":np.arange(31,37.1,0.1),
                       "ordenadas":scipy.stats.norm.pdf(np.arange(31,37.1,0.1),loc=20*1.7,scale=(20*0.2**2)**0.5 )}

gaussiana_verdadera = pd.DataFrame(gaussiana_verdadera)

#%%

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