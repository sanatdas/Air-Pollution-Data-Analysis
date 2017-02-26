# plot6
#Compare emissions from motor vehicle sources in Baltimore City with emissions
#from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vhicle emissions ?
#
library(ggplot2)
# read the data files
if(!exists("NEI")){
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}
if(!exists("NEISCC")){
        NEISCC <- merge(NEI, SCC, by="SCC")
}
# subset the data for only Baltimore City, Maryland and type as "on-road"
NEI.subset <- subset(NEI,(fips == "24510" | fips == "06037") & type == "ON-ROAD")
#aggregate the data for years and fips
aggregatedTotalYF <- aggregate(Emissions ~ year+fips,NEI.subset, sum)
#add a new column for county names based the fips value. 
aggregatedTotalYF$county <- ifelse(aggregatedTotalYF$fips == "24510", "Baltimore,MD","Los Angeles,CA")
# plot the variables, create the png file 
png("plot6.png", width=640, height=480)
g <- ggplot(aggregatedTotalYF,aes(year,Emissions,color=county))
plot6 <- g + geom_line() + xlab("Years") + ylab("Emission Level")+
        ggtitle("Motor Vehicle Emissions in \n Baltimore City vs. Los Angeles County") + 
        theme(plot.title = element_text(hjust = 0.5,face="bold",size=14))
print(plot6)
dev.off()