---
title       : Data products final project
subtitle    : Pitching (mtcars) data exploration gadget
author      : Omer Yavin
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<style>
.title-slide {
 background-image: url(http://www.luxurytopics.com/chest/timg/1417692874_luxury-cars-top-10-most-expensive-sport-cars-in-the-world-99.jpg) no-repeat;
 background-size: 100%;
}
.title-slide hgroup > h1, 
.title-slide hgroup > h2,
.title-slide hgroup > p {
  color: #FFFFFF;
  padding-bottom: 1px
}
</style>


## Data exploration

In data exploring, AKA exploratory data analyses, one may hope to find the nature of some inter-variable relations. The most basic tool for such explorations is the plot.

Creating these plots may be time consuming and deciding what to plot is not always straight forward.

--- data exploration issue presented

## Plot gadget

In this project I present a gadget for quick and simple plotting.
For simplicity and for time I've created only an example of the final product for mtcars dataset.

The final product works thus:
- Choose values (or 'don't care') for each factor variable.
- Choose which value to plot MPG against.

--- basic example described

## mtcars dataset

The mtcars dataset was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles.

It consists of a data frame with 32 observations on 11 variables, some of which may be treated as factors.
To "factorize"" the dataset the following piece of code is used.

```r
mtcars2 <- within(mtcars, {
      am <- factor(am, labels = c("automatic", "manual"))
      cyl <- as.factor(cyl)
      gear <- as.factor(gear)
      vs <- factor(vs, labels = c("v-shaped", "straight"))
      carb <- as.factor(carb)
})
```
To filter the dataset according to the radio button input, several lines similar to the following are used.

```r
mtcars2<-if(input$am=='X') mtcars2 else mtcars2[mtcars2$am==input$am,]
```


--- mtcars dataset introduced

## Further work
For later steps, I would allow the user to select a dataset, and the appropriate plot gadget would be created.
- The variables which may be "factorized" would automatically be found (include a single-digit number of unique values) using "apply" and "unique".

```r
lstFactors<-list()
dfCount<-as.data.frame(as.list(apply(mtcars, 2, function(x) length(unique(x)))))
for (var in colnames(dfCount)) {
   if(dfCount[var]<10) lstFactors[var]<-unique(mtcars[var])
}
print(lstFactors[1]) #print just the first factor as example
```

```
## $cyl
## [1] 6 4 8
```
- The gadget can also be updated to allow boxplots and 3d plots.


