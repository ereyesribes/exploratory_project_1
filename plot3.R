library(ggplot2)
library(dplyr)

# Read & subset dataset for Baltimore city.
baltimore_fips = "24510"

dataset <- readRDS('data/summarySCC_PM25.rds')

# Filter for fips = baltimore, sum total PM25 emissions by year & type
processed <- summarize(group_by(filter(dataset, fips == baltimore_fips), year, type), Emissions = sum(Emissions))

png('plot3.png')

# Plot with ggplot, 1 facet per pollutant type.
with(processed, qplot(year, Emissions, facets = . ~ type, geom = c("point", "line"), main = "PM25 in Baltimore by type"))

dev.off()
