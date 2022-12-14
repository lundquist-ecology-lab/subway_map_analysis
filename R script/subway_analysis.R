## ---- data_input--------------------------------------------------------------
data <- read.csv("subway_data.csv", header = TRUE, stringsAsFactors = TRUE)


## ----park_vs_total_area-------------------------------------------------------

y <- ((data$g_area) / 1000000)
x <- ((data$b_area) / 1000000)

model_area <- lm(y ~ x)
summary(model_area)

plot(x, y, ylab = expression(Park ~ area ~ (km^2), ylim = c(0, 25)),
     xlab = expression(Total ~ borough ~ area ~ (km^2)), pch = 16)
text(y = y[1], x = x[1] + 20, "Manhattan")
text(y = y[2], x = x[2] - 18, "Brooklyn")
text(y = y[3], x = x[3] - 15, "Queens")
text(y = y[4], x = x[4] - 12, "Bronx")
text(y = y[5], x = x[5] + 25, "Staten Island")


## ----no_of_stations-----------------------------------------------------------

y <- data$g_stations
x <- data$stations

station_model <- glm(y ~ x, family = poisson)
summary(station_model)

plot(y ~ x, ylab = expression("No. of subway stations "<="100 m from a park"),
     xlab = "Total no. of subway stations", pch = 16)
text(y = y[1], x = x[1] - 18, "Manhattan")
text(y = y[2], x = x[2] - 17, "Brooklyn")
text(y = y[3] - 2, x = x[3] - 16, "Queens")
text(y = y[4], x = x[4] - 15, "Bronx")
text(y = y[5], x = x[5] + 21, "Staten Island")


## ----stations_vs_area---------------------------------------------------------
## Total Area

x <- data$b_area / 1000000
y <- data$g_stations

area_model <- glm(y ~ x, family = poisson)
summary(area_model)

plot(x, y, pch = 16, ylab = expression("No. of subway stations "<="100 m from a park"),
     xlab = expression(Total ~ borough ~ area ~ (km^2)))
text(y = y[1], x = x[1] + 20, "Manhattan")
text(y = y[2], x = x[2] - 17, "Brooklyn")
text(y = y[3], x = x[3] - 16, "Queens")
text(y = y[4], x = x[4] - 14, "Bronx")
text(y = y[5], x = x[5] + 23, "Staten Island")


## ----stations_vs_green--------------------------------------------------------

x <- data$g_area / 1000000
y <- data$g_stations

green_model <- glm(y ~ x, family = poisson)
summary(green_model)

plot(x, y, pch = 16, ylab = expression("No. of subway stations "<="100 m from a park"),
     xlab = expression(Park ~ area ~ (km^2)))
text(y = y[1], x = x[1] + 1.5, "Manhattan")
text(y = y[2], x = x[2] - 1.2, "Brooklyn")
text(y = y[3], x = x[3] - 1.1, "Queens")
text(y = y[4], x = x[4] + 1, "Bronx")
text(y = y[5], x = x[5] - 1.8, "Staten Island")