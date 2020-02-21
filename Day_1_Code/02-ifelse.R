library(testthat) #used to test functions. puts in expected values

k_c = function(k_temp) {
  if (k_temp < 0) {
    warning("You passed in a negative kelvin number")
    return(NA)
  } else {
    return (k_temp - 273.15)
  }
}

k_c(-2)

k_c = function(k_temp) {
  if (is.na(k_temp)) {
    return(NA)
  } else if (k_temp < 0) {
    warning("You passed in a negative kelvin number")
    return(NA)
  } else {
    return (k_temp - 273.15)
  }
}

k_c(NA)

identical(c(TRUE, FALSE), c(TRUE, FALSE))
identical(0, 0L)

# & |
# && ||

c(TRUE, FALSE) || c(TRUE, FALSE)

# popular interview question -> function
# takes single value
# if divisable by 3: "fiz"
# if divisable by 5: "buz"
# if divisable by both: "fizzbuzz"
# %%

fizzbuzz <- function(x) {
  if ((x %% 3) == 0 & (x %% 5) == 0) {
    return("fizzbuzz")
  } else if ((x %% 3) == 0) {
    return("fizz")
  } else if ((x %% 5) == 0) {
    return("buzz")
  } else {
    return(as.character(x))
  }
}

fizzbuzz(15)
fizzbuzz(6)
fizzbuzz(5)
fizzbuzz(7)

library(tidyverse)

fizzbuzz2 <- function(x) {
  dplyr::case_when(
    (x %% 3) == 0 & (x && 5) == 0 ~ "fizzbuzz",
    (x %% 3) == 0 ~ "fizz",
    (x %% 5) == 0 ~ "buzz",
    TRUE ~ as.character(x)
  )
}

fizzbuzz2(15)
fizzbuzz2(6)
fizzbuzz2(5)
fizzbuzz2(7)

3 + 3
my_expr <- ~ 3 + 3
my_expr[[1]]
my_expr[[2]]

calc_op <- function(x, y, op) {
  switch(op,
         plus = x + y,
         minus = x - Y,
         times = x * y,
         divide = x / y,
         stop("Unknown op!")
         )
}

calc_op(5, 5, "plus")

values <- 22

cut(values,
    c(-Inf, 0, 10, 20, 30, Inf),
    labels = c("freezing", "cold", "cool", "warm", "hot"),
    right = TRUE)