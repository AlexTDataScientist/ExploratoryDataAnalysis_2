library(data.table)
library(dplyr)


setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week3")


SCC <- as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

data2 <- NEI %>%
	filter(fips == "24510") %>%
	group_by(year) %>%
	summarise(TotalEmissions = sum(Emissions))

png(file='plot2.png')
barplot(data2$TotalEmissions, names=data1$year, main =  "Baltimore City", ylab="PM2.5 Emissions, Tons")
dev.off()