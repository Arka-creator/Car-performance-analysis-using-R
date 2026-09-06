# Car Performance Analysis Using R
#---------------------------------------

Data_Cars <- mtcars

# Display the first 6 rows of the dataset
head(Data_Cars)
# Display the last 6 rows
tail(Data_Cars)

# Display the structure of the dataset
str(Data_Cars)
# Display the dimensions of the dataset
dim(Data_Cars)
# Display column names
names(Data_Cars)
# Display statistical summary
summary(Data_Cars)

# Calculate average mileage
average_mileage <- mean(Data_Cars$mpg)
average_mileage

# Average horsepower
average_horsepower <- mean(Data_Cars$hp)
average_horsepower

# Most powerful car
most_powerful_car <- Data_Cars[which.max(Data_Cars$hp), ]
most_powerful_car

# Least powerful car
least_powerful_car <- Data_Cars[which.min(Data_Cars$hp), ]
least_powerful_car

# Correlation between horsepower and mileage
correlation_hp_mpg <- cor(Data_Cars$hp, Data_Cars$mpg)
correlation_hp_mpg

# Car with highest mileage
highest_mileage_car <- Data_Cars[which.max(Data_Cars$mpg), ]
highest_mileage_car

# Car with lowest mileage
lowest_mileage_car <- Data_Cars[which.min(Data_Cars$mpg), ]
lowest_mileage_car

# Heaviest and lightest car
heaviest_car <- Data_Cars[which.max(Data_Cars$wt), ]
heaviest_car
lightest_car <- Data_Cars[which.min(Data_Cars$wt), ]
lightest_car

# Horsepower vs Mileage
if (!dir.exists("plots")) {
  dir.create("plots")
}
png(filename = "plots/hp_vs_mileage.png")
x1 <- Data_Cars$hp
y1 <- Data_Cars$mpg
plot(x1, y1, main = "Horsepower vs Mileage", xlab = "Horsepower", ylab = "Mileage (mpg)", pch = 19, col = "#ff0000")
dev.off()

# Weight vs Mileage
png(filename = "plots/wt_vs_mileage.png")
x2 <- Data_Cars$wt
y2 <- Data_Cars$mpg
plot(x2, y2, main = "Weight vs Mileage", xlab = "Weight", ylab = "Mileage (mpg)", pch = 19, col = "#d11515fd")
dev.off()

# Distribution of Mileage
png(filename = "plots/mileage_distribution.png")
hist(Data_Cars$mpg, main = "Distribution of Mileage", xlab = "Mileage (mpg)", col = "#40ee19", border = "black")
dev.off()

#Average Mileage by Cylinder
average_mileage_by_cyl <- aggregate(mpg ~ cyl, data = Data_Cars, FUN = mean)
png(filename = "plots/average_mileage_by_cyl.png")
barplot(average_mileage_by_cyl$mpg, names.arg = average_mileage_by_cyl$cyl, main = "Average Mileage by Cylinder", xlab = "Number of Cylinders", ylab = "Average Mileage (mpg)")
dev.off()

#Manual vs Automatic Transmission Mileage
average_mileage_by_am <- aggregate(mpg ~ am, data = Data_Cars, FUN = mean)
png(filename = "plots/average_mileage_by_am.png")
barplot(average_mileage_by_am$mpg, names.arg = c("Automatic", "Manual"), main = "Average Mileage by Transmission", xlab = "Transmission", ylab = "Average Mileage (mpg)")
dev.off()