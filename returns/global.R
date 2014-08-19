library(quantmod)
library(xlsx)
library(plyr)
library(reshape2)

# download SP500 from Shiller's data page if it hasn't been downloaded already
url <- "http://www.econ.yale.edu/~shiller/data/chapt26.xls"
if (!file.exists("./data/chapt26.xls")) {
        download.file(url = url,
                      destfile = "./data/chapt26.xls")
}

# read "Data" sheet into R using headers in 3rd row
rawData <- read.xlsx(file = "./data/chapt26.xls",
                     startRow=3,
                     endRow = 150,
                     header = T,
                     sheetName = "Data",
                     stringsAsFactors = F
                     )
# head(rawData)
# discard unnecessary rows
rawData <- rawData[-(1:5), ]

# convert all data to class "numeric"
rawData <- data.frame(apply(rawData, 2, function(x) as.numeric(x)))

# head(rawData)
# extract and properly label needed data columns
rawData <- with(rawData, data.frame(year = NA.,
                                     price = P,
                                     dividend = D,
                                     rate1yr = R/100 +1,
                                     cpi = CPI))

# head(rawData)
# calcualte real prices and real returns
curCPI <- last(rawData$cpi)
tidyData <- mutate(rawData,
                  SPTotalReturn = 1 + as.numeric(Delt(price) + dividend / lag(price)),
                  realPrice = price * curCPI / rawData$cpi,
                  realDividend = dividend * curCPI / rawData$cpi,
                  realRate1yr = as.numeric(rate1yr*cpi/Next(cpi)),
                  realSPTotalReturn = 1 + as.numeric(Delt(realPrice) + realDividend/lag(realPrice))
                  )
#head(tidyData)
# interactive input

