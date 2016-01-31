---
title       : Eye Color from Hair Color and Sex
author      : Phillip Chaffee
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Eye Color Guesser

- This project takes hair color and sex as inputs and makes a guess at eye color.
- It uses the HairEyeColor dataset from the R datasets package.
- It is just for fun! 

---

## Prediction Model

- It uses a random forest fit to predict eye color from hair color and sex.
- HairEyeColor is a table. It is transformed into a data frame using as.data.frame.table()
- Then fit using caret:

```r
suppressMessages(require(caret))
suppressMessages(require(e1071))
suppressMessages(require(datasets))
data <- as.data.frame.table(HairEyeColor)
suppressMessages(fit <- train(Eye ~ Hair+Sex, data=data, method="rf", weights = data$Freq))
fit$results
```

```
##   mtry    Accuracy      Kappa AccuracySD    KappaSD
## 1    2 0.006190476 -0.2658472 0.02149461 0.08186349
## 2    3 0.006190476 -0.2729271 0.02149461 0.07553391
## 3    4 0.006190476 -0.2850386 0.02149461 0.08193343
```

---

## Accuracy

- It only has an accuracy of less than 1% because the data set is so limited in size.
- That is why it is only a guess and just for fun!

---

## Final Thoughts

- It was just for fun, but it still taught me Slidify and Shiny well.
- This is my final class in the specialization. I have enjoyed class with you all!
- I hope to see and work with you in the capstone!
- Good luck to all my fellow classmates!
