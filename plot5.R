library(dplyr)


# Subset the dataset by type == ONROAD + baltimore.
baltimore_fips = "24510"
dataset <- readRDS('data/summarySCC_PM25.rds')
vehicle_pm <- subset(dataset, fips == baltimore_fips & type == "ON-ROAD")


# Calculate total emissions per year.
vehicle_per_year <- tapply(as.numeric(vehicle_pm$Emissions), vehicle_pm$year, sum)

png('plot5.png')

# Make the total PM25 plot
plot(as.numeric(names(vehicle_per_year)), vehicle_per_year, main = "Particulate Matter 2.5, motor vehicle sources, Baltimore", ylab = "Motor Vehicle Emmissions", xlab = "Year")
segments(as.numeric(names(vehicle_per_year)[-nrow(vehicle_per_year)]), vehicle_per_year[-nrow(vehicle_per_year)], as.numeric(names(vehicle_per_year)[-1]), vehicle_per_year[-1])

dev.off()
