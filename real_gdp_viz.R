library(tidyverse)

rm(list=ls())

gdp <- as.tibble(read.csv("C:/Users/Clemens/Google Drive/5Semester/Masterarbeit/data/real_gdp.csv"))
credit <- as.tibble(read.csv("C:/Users/Clemens/Google Drive/5Semester/Masterarbeit/data/credit.csv"))

gdp <- as.tibble(cbind(gdp["TIME"], gdp["Value"]))
credit <- as.tibble(cbind(credit["TIME"], credit["Value"]))

combined <- tibble(time = gdp$TIME, gdp_real = gdp$Value,
                            credit = credit$Value)

ggplot(data = combined, aes(x = time)) +
  geom_line(aes(y = gdp_real, color = "BIP real"), size = 2) +
  geom_line(aes(y = credit, color = "Kreditvolumen (transparent)"), size = 2, alpha = 0.5) +
  scale_color_manual(name = "Legende", 
                     values = c("BIP real" = "blue", "Kreditvolumen (transparent)" = "red")) +
  scale_x_continuous(breaks = pretty(gdp$TIME, n=21)) +
  labs(title="Entwicklung von Kreditvolumen und realem BIP Deutschland 1995-2017",
       y="Veränderung in %", x="Jahre", caption="Quelle: OECD") +
  theme(legend.position = c(0.12, 0.8))

  
