# plot3 : out of the 4 types of sources (point, nonpoint, onroad, nonroad)
# Which of the 4 sources have seen decreases in emissions from 1999 - 2008 for Baltimore City ?
# Which have seen increase in emissions from 1999 - 2008 ?
# Use ggplot2 plotting system to make a plot to answer the question 
#
library(ggplot2)
# Read the file
if(!exists("NEI")){
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}
# take data for only Baltimore City, Maryland(fips == "24510")
NEI <- subset(NEI,fips == "24510")

aggregatedTotalByYearType <- aggregate(Emissions ~ year+type,NEI, sum)

# plot the variables, create the png file 
png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearType,aes(year,Emissions,color=type))
plot3 <- g + geom_line() + xlab("Years") + ylab("Total PM2.5 Emissions")+
        ggtitle("Baltimore City: Total Emissions (PM2.5) by type from year 1999 - 2008")+
        theme(plot.title = element_text(hjust = 0.5,face="bold",size=14))
print(plot3)
dev.off()
