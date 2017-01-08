#Clean wip data

library(tidyverse)

rawWipData <- read_csv("wipData.csv")

cleanWipData <- 
  rawWipData %>%
  select(`Type of Work`, `Task Status`, `CMS Code`, `Quant Budget`, 
    `internal deadline`) %>%
  drop_na() %>%
  filter(`Task Status` == "Completed") %>%
  select(-`Task Status`) %>%
  mutate(`Quant Budget` = as.numeric(`Quant Budget`)) %>%
  drop_na() %>%
  filter(`Quant Budget` > 0) %>%
  mutate(`internal deadline` = lubridate::dmy(`internal deadline`)) %>%
  mutate(`proj date` = 
      paste0(
        lubridate::month(`internal deadline`, label = TRUE), " ", 
        lubridate::year(`internal deadline`))) %>%
  select(-`internal deadline`)

workGroupings <- 
  c("ALM", "LDI", "Structure", "Cashflows", "3DA", "Other")

x <- stringr::str_detect(unique(cleanWipData$`Type of Work`), "LDI")





