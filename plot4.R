#plot4:
#Across the US, how have emissions from coal combustion-related sources changed from 1999 - 2008
library(ggplot2)
#read the files
if(!exists("NEI")){
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}

if(!exists("SCC")){
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# select records for coal  combustion-related sources
SCC.coal <-SCC[grepl("Coal",SCC$Short.Name,ignore.case = TRUE),]
NEI.coal <- NEI[NEI$SCC %in% SCC.coal$SCC,]

aggregatedTotalByYearCoal <- aggregate(Emissions ~ year,NEI.coal, sum)
# plot the variables, create the png file 
png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearCoal,aes(factor(year),Emissions))
plot4 <- g + geom_bar(stat="identity") + xlab("Years") + ylab("PM2.5 Emissions")+
        ggtitle("Total Emissions from coal combustion-related sources from 1999 - 2008") +
        theme(plot.title = element_text(hjust = 0.5,face="bold",size=14))
print(plot4)
dev.off()
