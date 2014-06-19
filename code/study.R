### Studying WFP VAM data. 
library(xlsx)
library(ggplot2)

# loading the data
data <- read.xlsx('../data/FCSforHDX.xlsx', sheetIndex = 1, )

# Data from WFP has sub-national attributes. 
#  - figure out how that functionality is working on our system.
names(data)

# [1] "Counrty.Code"            "Country"                
# [3] "Adm.1"                   "Adm.2"                  
# [5] "Year.of.data.collection" "Poor"                   
# [7] "Borderline"              "Acceptable"             
# [9] "Metadata"                "Data.archive.link"  

## The data has: ##
# 3 measurements: Poor, Borderline, and Acceptable.
# 1 metadata field: Metadata
# 1 URl field: Data.archive.link

data$Poor <- as.numeric(data$Poor)
base <- ggplot(data) + theme_bw()
base + 
    geom_bar(aes(Adm.1, Poor, fill = Country), stat = "identity") +
#     geom_bar(aes(Adm.1, Acceptable), stat = "identity") +
#     geom_bar(aes(Adm.1, Borderline), stat = "identity") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
