#Выполнил: Плясунов Олег, БИ-18-1
#Установка библиотек и их подключение
install.packages('ggplot2')
install.packages('tidyverse')

library(ggplot2)
library(tidyverse)

#Подключение БД
KT <- read.csv("RU_Electricity_Market_PZ_dayahead_price_volume.csv", header = TRUE, sep = ",")

#Смотрим названия столбцов
names(KT)

#Создаем авторегрессионный процесс
set.seed(49)
y <- arima.sim(n = nrow(KT), table)
plot(y)

# Создаем графики
ggplot(data = KT)+
  geom_point(alpha = 1/2, mapping = aes(x= timestep, y = price_eur, color = consumption_eur))

ggplot(data = KT)+
  geom_point(alpha = 1/4, mapping = aes(x= consumption_eur, y = price_eur))