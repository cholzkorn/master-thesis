library(tidyverse)

rm(list=ls())

# source happiness: https://ourworldindata.org/happiness-and-life-satisfaction
# source gdp_cap: https://data.worldbank.org/indicator/NY.GDP.PCAP.CD

happiness <- as.tibble(read.csv("C:/Users/Clem/Desktop/master-thesis/happiness-cantril-ladder.csv"))
happiness <- filter(happiness, happiness["Year"] == 2016)

gdp_data <- as.tibble(read.csv("C:/Users/Clem/Desktop/master-thesis/gdp_cap_2016.csv"))

# Transform

hap <- tibble(country = happiness[[2,]], hap = happiness[[4,]])
gdp <- tibble(country = gdp_data[[2,]], gdp_cap = gdp_data[[3,]])


# Visualize

df <- inner_join(hap, gdp, by="country")

ggplot(data = df, aes(y = gdp_cap, x = hap)) +
  geom_point(aes()) +
  geom_text(aes(label=country),hjust=-0.5, vjust=-0.5) +
  labs(title="Lebenszufriedenheit und BIP pro Kopf",
       y="BIP pro Kopf in USD", x="Lebenszufriedenheit (1-10)", caption="Quelle: World Happiness Report 2017, Weltbank")
