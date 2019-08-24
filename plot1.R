dataset <- readRDS('data/summarySCC_PM25.rds')

# Calculate total emissions per year.
total_per_year <- tapply(as.numeric(dataset$Emissions), dataset$year, sum)

png('plot1.png')

# Make the total PM25 plot
plot(names(t), t, main = "Particulate Matter 2.5 throughout the years", ylab = "Total Emmissions", xlab = "Year")
segments(as.numeric(names(t)[1:3]), t[1:3], as.numeric(names(t)[2:4]), t[2:4])

dev.off()
