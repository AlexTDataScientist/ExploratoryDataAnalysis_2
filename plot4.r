library(data.table)
library(dplyr)


setwd("C:\\Users\\alexandru.toth\\datasciencecoursera\\DataPlotting-Week3")


SCC <- as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

coals <- SCC %>% filter(grepl('coal', Short.Name, ignore.case=TRUE)) %>% select(SCC) %>% distinct()

data4 <- NEI %>%
	inner_join(coals) %>%
	group_by(year) %>%
	summarise(TotalEmissions = sum(Emissions))

png(file='plot4.png')
barplot(data4$TotalEmissions, names=data1$year, ylab="PM2.5 Emissions, Tons", main="Coal related emissions")
dev.off()