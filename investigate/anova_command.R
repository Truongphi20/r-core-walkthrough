# Reference: https://www.youtube.com/watch?v=GokvYQiGdm0 (Andrew Gard)

model <- aov(chickwts$weight ~ chickwts$feed)
summary(model)

TukeyHSD(model)
