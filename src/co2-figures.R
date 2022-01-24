library(tidyverse)
load('data/emissions-clean.RData')

# emissions over time
fig1 <- emissions %>%
  ggplot(aes(x = year, 
             y = total.co2, 
             group = state)) +
  geom_path() +
  theme_bw() +
  scale_y_log10()

# view
fig1 

# plot population against emissions
fig2 <- emissions %>%
  ggplot(aes(x = log(population), 
             y = log(total.co2),
             color = year,
             group = state)) +
  geom_path() +
  theme_bw() 

# view
fig2

# combine
out <- gridExtra::grid.arrange(fig1, fig2, nrow = 1)

# export
ggsave(plot = out,
       filename = 'co2-emissions.png', 
       width = 7, 
       height = 3, 
       units = 'in', 
       dpi = 300)
