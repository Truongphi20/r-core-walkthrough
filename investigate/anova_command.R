# Reference: https://www.youtube.com/watch?v=GokvYQiGdm0 (Andrew Gard)

library(tidyverse)

model <- aov(chickwts$weight ~ chickwts$feed)
summary(model)

TukeyHSD(model)
