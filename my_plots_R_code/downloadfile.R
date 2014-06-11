

# Downloading and unziping the data
    dataUrl  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    file  <- "household_power_consumption.zip"
    download.file(url=dataUrl, destfile=file, method="curl")
    # Methods "wget" and "lynx" are mainly for historical compatibility, but they and "curl" can be used for URLs (e.g. https:// URLs or those that use cookies) which the internal method does not support. They will block all other activity on the R process.
    unzip(zipfile=file, exdir="./")
    filename = gsub(pattern=".zip", replacement=".txt", x=file)
    filename
    # [1] "household_power_consumption.txt"


# Loadind the dataset in a data frame
    pconsum  <- read.table(file="household_power_consumption.txt", stringsAsFactors=F, header=T , sep=";")
    head(pconsum)

    x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?" )
