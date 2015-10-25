# Question 3:
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City? Which have seen increases in
# emissions from 1999-2008? Use the ggplot2 plotting system to make a plot
# answer this question.

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

BaltimoreSubset <- subset(NEI, fips == "24510")
  
TotalByYearAndType <- aggregate(Emissions ~ year + type, BaltimoreSubset, sum)

png("plot3.png")
g <- ggplot(TotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
print(g)

dev.off()