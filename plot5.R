# plot5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 
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
NEI.motor <- subset(NEI,fips == "24510" & type == "ON-ROAD")

aggregatedTotalByYearMotor <- aggregate(Emissions ~ year, NEI.motor, sum)
# plot the variables, create the png file 
png("plot5.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearMotor,aes(factor(year),Emissions))
plot5 <- g + geom_bar(stat="identity",width=0.5) + xlab("Years") + ylab("PM2.5 Emissions")+
        ggtitle("Emissions from  motor vehicle in Baltimore City from 1999 - 2008") +
        theme(plot.title = element_text(hjust = 0.5,face="bold",size=14))
print(plot5)
dev.off()
