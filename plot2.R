# plot2 : To demonstrate if the total emissions from PM2.5 decreases
# in the Baltimore City, Maryland(fips == "24510") from 1999 to 2008?
# Use base plotting system to make a plot answering this question
#
# Read the source data
if(!exists("NEI")){
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}
# take data for only Baltimore City, Maryland(fips == "24510")
NEI <- subset(NEI,fips == "24510")

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

# plot the variables, create the png file 
barplot(height=aggregatedTotalByYear$Emissions,names.arg=aggregatedTotalByYear$year,xlab="Years", ylab="PM2.5 Emissions",main="Total PM2.5 Emissions in Baltimore City, Maryland from 1999 to 2008",cex.main=1)
dev.copy(png,file="plot2.png")
dev.off()
