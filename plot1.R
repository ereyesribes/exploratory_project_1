dataset <- readRDS('data/summarySCC_PM25.rds')

# Calculate total emissions per year.
total_per_year <- tapply(as.numeric(dataset$Emissions), dataset$year, sum)

png('plot1.png')

# Make the total PM25 plot
plot(as.numeric(names(total_per_year)), total_per_year, main = "Particulate Matter 2.5 throughout the years", ylab = "Total Emmissions", xlab = "Year")
segments(as.numeric(names(total_per_year)[-nrow(total_per_year)]), total_per_year[-nrow(total_per_year)], as.numeric(names(total_per_year)[-1]), total_per_year[-1])

dev.off()
