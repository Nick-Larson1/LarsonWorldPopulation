
WorldPop <- read_excel('World_Population.xlsx', sheet='ESTIMATES', range= 'A17:bz306')

WorldPopulation <- WorldPop %>% select(-Variant, -Index, -Notes, -`Country code`, -`Parent code`, -Type) %>% slice(-2, -10, -17, -24)
