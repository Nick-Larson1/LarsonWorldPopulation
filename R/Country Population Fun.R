#' Country Population
#'
#' Creates a graph of population changes over time for a country
#'
#' @param a Name of Country
#' @return The graph of Population of that country over time
#' @example
#' CountryPopulation('Italy')
#' @export
CountryPopulation <- function(a){

  library(tidyverse)
  library(readxl)
  library(ggrepel)
  library(stringr)
  library(patchwork)
  library(cowplot)

WorldPopulation <- WorldPop %>% select(-Variant, -Index, -Notes, -`Country code`, -`Parent code`, -Type) %>% slice(-2, -10, -17, -24) %>%
  filter(`Region, subregion, country or area *` == a) %>% pivot_longer(
      '1950':'2020',
      names_to = 'Year',
      values_to = 'Population'
    )
  WorldPopulation$Population <-
    as.numeric(WorldPopulation$Population)
  WorldPopulation$Year <- as.numeric(WorldPopulation$Year)

  ggplot(WorldPopulation, aes(x=Year, y=Population)) +
    geom_point()+
    labs(title=a)

}
