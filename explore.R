#' ---
#' title: "Traffic violations"
#' author: "Taavi Päll"
#' date: "2018-10-25 (updated `r Sys.Date()`)"
#' output: 
#'     github_document:
#'         html_preview: false
#' ---

#' ## Load libraries
library(tidyverse)
library(skimr)

#' ## Import dataset
#' Here we use `fread` function from **data.table** library 
#' because we have no idea what delimiters are being used in this file 
#' (we cannot trust file extension) and `fread` has automatic delimiter detection. 
violations <- data.table::fread("data/liiklusjarelevalve_3.csv") %>% 
  as_data_frame()
violations

#' ## Explore
#' Let's have a look how this dataset looks like and what kind of variables it has in it.
skim(violations)

#' ## Translate variable names to English
#' We have mostly character data and we need to translate variable names to English.
#' 
colnames(violations)
#' - Liiklusseadus = Traffic Act
#' - väärtegu = misdemeanour
colnames(violations) <- c("case_id", "date", "time", "weekday", "legislative_act", "section", 
  "section_title", "subsection", "clause", "violated_point_of_law", "county",
  "municipality", "district", "road_type", "road_name", "km", "lest_x", 
  "lest_y", "car_type", "reg_country", "car_make", "car_year", "sex", "age", "residence", "offence")
write_csv(violations, "output/traffic_supervision.csv")

#' Print out table with English names:
violations

#' Skim again:
skim(violations)


