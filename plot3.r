library(data.table)
library(dplyr)
library(ggplot2)


setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week3")


SCC <- as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

data3 <- NEI %>%
	filter(fips == "24510") %>%
	group_by(year, type) %>%
	summarise(TotalEmissions = sum(Emissions))

png(file='plot3.png')
ggplot(data3, aes(year, TotalEmissions, color=type)) + geom_line() + ggtitle("Emissions in Baltimore City") + ylab("PM2.5 Emissions")
dev.off()