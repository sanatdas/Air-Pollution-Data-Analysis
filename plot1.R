# plot1 : To find out if
# the total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008
#
# 1. Read the source files
if(!exists("NEI")){
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}

if(!exists("SCC")){
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

# plot the variables, create the png file 

barplot(height=aggregatedTotalByYear$Emissions,names.arg=aggregatedTotalByYear$year,xlab="Years", ylab="Total PM2.5 Emissions per year ",main="Total PM2.5 Emission per Year")

dev.copy(png,file="plot1.png")
dev.off()
