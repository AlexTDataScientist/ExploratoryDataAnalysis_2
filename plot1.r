library(data.table)
library(dplyr)


setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week3")


SCC <- as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

data1 <- NEI %>%
	group_by(year) %>%
	summarise(TotalEmissions = sum(Emissions)) %>%
	mutate(TotalEmissions = TotalEmissions / 1000000)

png(file='plot1.png')
# display Y axis in millions rather than scientific format
barplot(data1$TotalEmissions, names=data1$year, ylab="PM2.5 Emissions, Millions of Tons")
dev.off()