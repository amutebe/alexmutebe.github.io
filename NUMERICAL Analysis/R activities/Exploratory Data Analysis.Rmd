---
title: "UNIT 5"
author: "Alex"
date: "16 January 2024"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
library(dplyr)
library(ggplot2)

crime_data <- read_sav("csew1314teachingopen.sav")
boxplot(crime_data$antisocx)
summary((crime_data$antisocx))

ggplot(data = crime_data,mapping= aes(x=antisocx,fill = antisocx)) + geom_boxplot(outlier.colour = "red", outlier.shape = 16) + ggtitle("Levels of anti-social behaviour in neighbourhood ‘antisocx") +
  xlab("antisocx") +
  ylab("Y-axis Label") +
  theme_minimal()
bxplot
```
```{r}
ggplot(data = crime_data,mapping= aes(x=bcsvictim, fill=bcsvictim)) + geom_bar(color = "green") + ggtitle("whether or not the survey respondents experienced crime in the 12 months prior to the survey") +
  xlab("bcsvictim") +
  ylab("Y-axis Label") +
  theme_minimal() +
  scale_fill_manual(values = c("white", "orange"))  # Set the bar color to orange

```

```{r}
x<- c(2,45,78,23,14,56,89,23,45,56,78,3,4)
y<- c(17,45,78,23,40,56,89,23,45,56,78,50,90)
cor(x,y, method="pearson")

hist(x)
hist(y)


```

```{r}
qqnorm(x)
qqline(x)
```
```{r}
qqline(x)
```
```{r}
library("car")
qqPlot(x)
```
```{r}
ks.test(x,"pnorm")
```

```{r}
ks.test(y,"pnorm")
```

```{r}
plot(density(y), col = "blue", main = "Density Plot")
```
```{r}
plot(x,y)
```
```{r}
set.seed(123)
data <- data.frame(
  group = rep(c("A", "B", "C"), each = 50),
  values = c(rnorm(50, mean = 10, sd = 2),
             rnorm(50, mean = 15, sd = 2),
             rnorm(50, mean = 12, sd = 3))
)

# Create a violin plot using ggplot2
ggplot(data, aes(x = group, y = values, fill = group)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1, fill = "white", color = "black") +
  labs(title = "Violin Plot Example", x = "Group", y = "Values") +
  theme_minimal()
```

