


t <- head(values, 2) %>%
  deparse()

b <- head(boxplot(t), 2) %>%
  deparse()


reprex (input = boxplot(t), venue = "so", render = T) 
