
# Load Libraries ----------------------------------------------------------

install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
install.packages("tidyverse") 
install.packages("dplyr") 

library(tidyverse)  
library(lubridate)
library(magrittr) 
library(dplyr)    


# Load data from 2007-02-01 to 2007-02-02

data <- read_delim("C:/household_power_consumption.txt",
                   delim = ";",
                   na    = c("?"),
                   col_types = list(col_date(format = "%d/%m/%Y"),
                                    col_time(format = ""),
                                    col_number(),
                                    col_number(),
                                    col_number(),
                                    col_number(),
                                    col_number(),
                                    col_number(),
                                    col_number())  ) %>%
  filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))



hist(data$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     col  = "red",
     main = "Global Active Power")

dev.copy(png, "plot1.png",
         width  = 480,
         height = 480)

dev.off()
