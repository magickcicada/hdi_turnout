library(psych)
library(tidyverse)
library(grid)
library(gridExtra)

load("stpan.Rdata")


# BASIC CORRELATIONS ====

# 2012: VEP .42 / VAP .24 / ACS .45
cor12_vep <- 
  cor(
    subset(stpan, year == "2012", select = hdi),
    subset(stpan, year == "2012", select = tovep)
  )[1]

cor12_vap <-   
  cor(
    subset(stpan, year == "2012", select = hdi),
    subset(stpan, year == "2012", select = tovap)
  )[1]

cor12_acs <-   
  cor(
    subset(stpan, year == "2012", select = hdi),
    subset(stpan, year == "2012", select = toacs)
  )[1]
  


# 2016: VEP .44 / VAP .25 / ACS .46 -- SIMILAR to 2012, GOOD!
cor16_vep <- 
  cor(
    subset(stpan, year == "2016", select = hdi),
    subset(stpan, year == "2016", select = tovep)
  )[1]

cor16_vap <-   
  cor(
    subset(stpan, year == "2016", select = hdi),
    subset(stpan, year == "2016", select = tovap)
  )[1]
  
cor16_acs <- 
  cor(
    subset(stpan, year == "2016", select = hdi),
    subset(stpan, year == "2016", select = toacs)
  )[1]

  
# POOLED: VEP .43 / VAP .25 / ACS .46 -- Similar, as expected
corpool_vep <- cor(stpan$hdi, stpan$tovep)[1]
corpool_vap <- cor(stpan$hdi, stpan$tovap)[1]
corpool_acs <- cor(stpan$hdi, stpan$toacs)[1]
  

  
# 2012 SCATTERPLOTS ====

# 2012 VEP
scat12_vep <-   
  stpan %>% 
    filter(year == "2012") %>% 
    ggplot(aes(x = hdi, y = tovep)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0,
        color = "grey70"
      ) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      labs(
        title = paste0("2012 VEP, r = ", round(cor12_vep, 3)),
        x = "",
        y = ""
      )
scat12_vep  

# 2012 VAP
scat12_vap <-   
  stpan %>% 
    filter(year == "2012") %>% 
    ggplot(aes(x = hdi, y = tovap)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0,
        color = "grey70"
      ) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      labs(
        title = paste0("2012 VAP, r = ", round(cor12_vap, 3)),
        x = "",
        y = ""
      )
scat12_vap  

# 2012 ACS VEP
scat12_acs <-   
  stpan %>% 
    filter(year == "2012") %>% 
    ggplot(aes(x = hdi, y = toacs)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0,
        color = "grey70"
      ) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      labs(
        title = paste0("2012 ACS VEP, r = ", round(cor12_acs, 3)),
        x = "",
        y = ""
      )
scat12_acs  



# 2016 SCATTERPLOTS ====


# 2016 VEP
scat16_vep <-   
  stpan %>% 
    filter(year == "2016") %>% 
    ggplot(aes(x = hdi, y = tovep)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0,
        color = "grey70"
      ) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      labs(
        title = paste0("2016 VEP, r = ", round(cor16_vep, 3)),
        x = "",
        y = ""
      )
scat16_vep  

# 2016 VAP
scat16_vap <-   
  stpan %>% 
    filter(year == "2016") %>% 
    ggplot(aes(x = hdi, y = tovap)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0,
        color = "grey70"
      ) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      labs(
        title = paste0("2016 VAP, r = ", round(cor16_vap, 3)),
        x = "",
        y = ""
      )
scat16_vap  

# 2016 ACS VEP
scat16_acs <-   
  stpan %>% 
    filter(year == "2016") %>% 
    ggplot(aes(x = hdi, y = toacs)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0,
        color = "grey70"
      ) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      labs(
        title = paste0("2016 ACS VEP, r = ", round(cor16_acs, 3)),
        x = "",
        y = ""
      )
scat16_acs  




# POOLED SCATTERPLOTS ====

# grey pallets
greys <- c("grey70", "grey30")

# Pooled VEP
pooled_vep <-   
  stpan %>% 
    ggplot(aes(x = hdi, y = tovep, color = year)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0
      ) +
      scale_color_manual(values = greys) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      theme(
        legend.position = c(.8, .25) ,
        legend.title = element_blank()
      ) +
      labs(
        title = paste0("Pooled VEP, r = ", round(corpool_vep, 3)),
        x = "",
        y = ""
      )
pooled_vep  


# Pooled VAP
pooled_vap <-   
  stpan %>% 
    ggplot(aes(x = hdi, y = tovap, color = year)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0
      ) +
      scale_color_manual(values = greys) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      theme(
        legend.position = c(.8, .25) ,
        legend.title = element_blank()
      ) +
      labs(
        title = paste0("Pooled VAP, r = ", round(corpool_vap, 3)),
        x = "",
        y = ""
      )
pooled_vap  

# Pooled ACS VEP
pooled_acs <-   
  stpan %>% 
    ggplot(aes(x = hdi, y = toacs, color = year)) +
      geom_point(
        shape = 16,
        alpha = .7,
        size = 4,
        stroke = 0
      ) +
      scale_color_manual(values = greys) +
      geom_smooth(
        se = FALSE,
        color = "orange",
        size = 1.5,
        method = "loess"
      ) +
      geom_smooth(
        se = FALSE,
        color = "seagreen",
        size = 1.5,
        method = "lm"
      ) +
      scale_x_continuous(limits = c(4,7.25)) +
      scale_y_continuous(limits = c(.35, .8)) +
      theme_minimal() +
      theme(
        legend.position = c(.8, .25) ,
        legend.title = element_blank()
      ) +
      labs(
        title = paste0("Pooled ACS VEP, r = ", round(corpool_acs, 3)),
        x = "",
        y = ""
      )
pooled_acs  
