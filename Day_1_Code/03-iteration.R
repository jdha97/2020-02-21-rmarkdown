f_values <- c(0, 32, 212, -40)

f_values * 10

f_values * c(10, 100)



f_k <- function(f_temp) {
  convereted <- ((f_temp - 32) * (5/9) + 273.15)
  return(convereted)
}

for (x in f_values) {
  print(x * 10)
}

for (x in f_values) {
  print(f_k(x))
}

library(tidyverse)

converted <- map(f_values, f_k)
(converted <- map_dbl(f_values, f_k))

mtcars

map(mtcars, class)
map(mtcars, summary)
mtcars %>% 
  mutate(mpg = as.numeric(mpg))

# apply lapply sapply capply

lapply(mtcars, f_k)

map_dbl(mtcars, mean)

sapply(mtcars, mean)
vapply(mtcars, mean, numeric(1)) #data type must be specified with vapply()

# mean of every column in mtcars
map(mtcars, mean)

# determin type of each column in nycflights13::flights
map(nycflights13::flights, class)

# number of unique values in each column of iris
unique2 <- function(x) {
  return(length(unique(x)))
}

map_dbl(iris, unique2)
map_dbl(iris, function(x){length(unique(x))})
map_dbl(iris, ~ length(unique(.)))

# generate 10 random normals from distribution of means -10, 0, 10, and 100
numbers <- c(-10, 0, 10, 100)
random2 <- function(x) {
  return(rnorm(10, x))
}
map(numbers, random2)

map(c(-10, 0, 10, 100), ~rnorm(n = 10, mean = .))

(safely_log <- safely(log))
log(10)
safely_log(10)
safely_log("a")

x <- list(1, 10, "a")
y <- x %>% map(safely_log)

flipped_results <- y %>%  transpose()
flipped_results$results

mu = list <-  list(5, 10, -3)
sigma <-      list(1, 5, 10)
n <-          list(1, 3, 5)

map(mu, rnorm, n = 5)
map2(mu, sigma, rnorm, n = 5)

pmap(list(mean = mu, sd = sigma, n = n), rnorm)

args <- list(mean = mu, sd = sigma, n = n)
pmap(args, rnorm)

# walk same as map
# difference between the two is that map always returns value
# Walk used for dealing with "side effects"