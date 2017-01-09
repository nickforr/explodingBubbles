#Clean wip data

library(tidyverse)

rawWipData <- read_csv("wipData.csv")

tempWipData <- 
  rawWipData %>%
  select(`Type of Work`, `Task Status`, `CMS Code`, `Quant Budget`, 
    `internal deadline`) %>%
  drop_na() %>%
  distinct() %>%
  filter(`Type of Work` != "Tender") %>%
  filter(`Task Status` == "Completed") %>%
  select(-`Task Status`) %>%
  mutate(`Quant Budget` = as.numeric(`Quant Budget`)) %>%
  drop_na() %>%
  filter(`Quant Budget` > 0) %>%
  mutate(`internal deadline` = lubridate::dmy(`internal deadline`)) %>%
  mutate(`proj year` = lubridate::year(`internal deadline`)) %>%
  filter(`proj year` >= 2014) %>%
  mutate(`proj year` = paste0("In ", `proj year`)) %>%
  mutate(`proj date` = 
      paste0(
        lubridate::month(`internal deadline`, label = TRUE), " ", 
        lubridate::year(`internal deadline`))) %>%
  select(-`internal deadline`)

workGroupings <- 
  list(
    "ALM" = c("Review", "ALM", "Funnel", "Intro to risk", "Triggers"), 
    "LDI" = c("LDI"), 
    "Structure" = c("Structure", "E(r)", "VaR"), 
    "Cashflows" = c("Cashflows", "cashflows", "cash flows"), 
    "3DA" = c("3D"), 
    "Other" = "NA"
  )

assignGroup <- function(x) {
  
  checkGroup <- 
    names(workGroupings) %>%
    map(~sum(stringr::str_detect(x, workGroupings[[.x]])) > 0) %>%
    simplify()
  if (sum(checkGroup) > 0) {
    names(workGroupings[checkGroup])  
  } else {
    "Other"
  }
}

cleanWipData <- 
  tempWipData %>%
  rowwise() %>%
  mutate(`Project Type` = assignGroup(`Type of Work`)) %>%
  select(-`Type of Work`)

write_csv(cleanWipData, "cleanWipData.csv")
