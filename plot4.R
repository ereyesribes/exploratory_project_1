library(dplyr)

# Fetch sources whose sector matches "fuel combustion + coal"
sources <- readRDS('data/Source_Classification_Code.rds')
coal_related <- sources %>% filter(grepl("Fuel Comb.*Coal", EI.Sector, ignore.case = T))



# Subset the dataset by coal related sources.
dataset <- readRDS('data/summarySCC_PM25.rds')
coal_pm <- dataset %>% subset(SCC %in% coal_related$SCC)


# Calculate total emissions per year.
coal_per_year <- tapply(as.numeric(coal_pm$Emissions), coal_pm$year, sum)

png('plot4.png')

# Make the total PM25 plot
plot(as.numeric(names(coal_per_year)), coal_per_year, main = "Particulate Matter 2.5, coal combustion", ylab = "Coal combustion Emmissions", xlab = "Year")
segments(as.numeric(names(coal_per_year)[-nrow(coal_per_year)]), coal_per_year[-nrow(coal_per_year)], as.numeric(names(coal_per_year)[-1]), coal_per_year[-1])

dev.off()
