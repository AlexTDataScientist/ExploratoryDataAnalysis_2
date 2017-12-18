library(data.table)
library(dplyr)


setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week3")


SCC <- as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

data5 <- NEI %>%
	filter(fips == "24510") %>%
	filter(type == "ON-ROAD") %>%
	group_by(year) %>%
	summarise(TotalEmissions = sum(Emissions))

png(file='plot5.png')
barplot(data5$TotalEmissions, names=data1$year, main =  "Baltimore City, On-ROAD", ylab="PM2.5 Emissions, Tons")
dev.off()