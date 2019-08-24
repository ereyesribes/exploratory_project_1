
# Read & subset dataset for Baltimore city.
baltimore_fips = "24510"

dataset <- readRDS('data/summarySCC_PM25.rds')
baltimore <- subset(dataset, fips == baltimore_fips)


# Calculate total emissions per year.
total_per_year <- tapply(as.numeric(baltimore$Emissions), baltimore$year, sum)

png('plot2.png')


# Make the total PM25 plot (for Baltimore)
plot(as.numeric(names(total_per_year)), total_per_year, main = "PM25 levels in Baltimore City", ylab = "Total Emmissions", xlab = "Year")
segments(as.numeric(names(total_per_year)[-nrow(total_per_year)]), total_per_year[-nrow(total_per_year)], as.numeric(names(total_per_year)[-1]), total_per_year[-1])

dev.off()
