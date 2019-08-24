# Compare emissions from motor vehicle sources in Baltimore City with emissions
#from motor vehicle sources in Los Angeles County, California (fips == "06037"\color
#{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes
#over time in motor vehicle emissions?

library(dplyr)

# Subset the dataset by type == ONROAD + baltimore or California.
baltimore_fips = "24510"
cali_fips = "06037"

dataset <- readRDS('data/summarySCC_PM25.rds')
balti_pm <- subset(dataset, fips == baltimore_fips & type == "ON-ROAD")
cali_pm <- subset(dataset, fips == cali_fips & type == "ON-ROAD")


# Calculate total emissions per year.
balti_per_year <- tapply(as.numeric(balti_pm$Emissions), balti_pm$year, sum)
cali_per_year <- tapply(as.numeric(cali_pm$Emissions), cali_pm$year, sum)

png('plot6.png')

par(mfrow = c(1, 2))

# Make the total PM25 plot, baltimore
plot(as.numeric(names(balti_per_year)), balti_per_year, main = "PM25, Baltimore, vehicles", ylab = "Emmissions", xlab = "Year")
segments(as.numeric(names(balti_per_year)[-nrow(balti_per_year)]), balti_per_year[-nrow(balti_per_year)], as.numeric(names(balti_per_year)[-1]), balti_per_year[-1])

# PM25 plot, California.
plot(as.numeric(names(cali_per_year)), cali_per_year, col = 2, lwd = 2, main = "PM25, California, vehicles", ylab = "Emmissions", xlab = "Year")
segments(as.numeric(names(cali_per_year)[-nrow(cali_per_year)]), cali_per_year[-nrow(cali_per_year)], as.numeric(names(cali_per_year)[-1]), cali_per_year[-1], col = 2, lwd = 2)

dev.off()
