# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")

BaltimoreSubset <- subset(NEI, fips == "24510")
  
totalPM25ByYear <- tapply(BaltimoreSubset$Emissions, BaltimoreSubset$year, sum)

png("plot2.png")
plot(names(totalPM25ByYear), totalPM25ByYear, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5]* "Emissions (tons)"),
     main=expression("Baltimore" ~ PM[2.5]* "Emissions by Year"))
dev.off()