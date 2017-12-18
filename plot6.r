library(data.table)
library(dplyr)
library(ggplot2)


setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week3")


SCC <- as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

fips <- data.frame(c("24510", "06037"), c("Baltimore City", "Los Angeles County"))
colnames(fips) <- c("fips", "name")


data6 <- NEI %>%
	filter(fips == "24510" | fips == "06037") %>%
	filter(type == "ON-ROAD") %>%
  left_join(fips) %>%
	group_by(year, name) %>%
	summarise(TotalEmissions = sum(Emissions))

png(file='plot6.png')
ggplot(data6, aes(year, TotalEmissions, color=name)) + geom_line() + ggtitle("Emissions") + ylab("PM2.5 Emissions")
dev.off()

