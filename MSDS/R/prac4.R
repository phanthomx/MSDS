data = c(1: 10)
# display
print(data)
min(data)
max(data)
mean(data)
median(data)
mode(data)
IQR(data)
sd(data)
max(data)-min(data)
install.packages("ggplot2")
library(ggplot2)
install.packages("mosaicData")
library(mosaicData)
data(Marriage, package = "mosaicData")
# plot the distribution of race
ggplot(Marriage, aes(x = race,fill = "pink")) + 
  geom_bar()

# plot the distribution of race with modified colors and labels
ggplot(Marriage, aes(x=race)) + 
  geom_bar(fill = "pink", 
           color="black") +
  labs(x = "Race", 
       y = "Frequency", 
       title = "Participants by race")

# calculate number of participants in each race category
install.packages("dplyr")
library(dplyr)
plotdata <- Marriage %>%
  count(race)
install.packages("ggpie")
library(ggpie)
ggpie(Marriage, race)

