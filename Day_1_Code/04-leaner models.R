
library(AmesHousing)
ames <- AmesHousing::make_ames()

lm_ames <- lm(Sale_Price ~ Gr_Liv_Area, data = ames)

library(parsnip)
#steps in parsnip
#Pick a model
#engine, lm
#mode

lm_spec <- parsnip::linear_reg() %>% 
  parsnip::set_engine("lm")

lm_fit <- parsnip::fit(lm_spec, Sale_Price ~ Gr_Liv_Area, data = ames)

broom::tidy(lm_fit)

#workflow and tune to compare models