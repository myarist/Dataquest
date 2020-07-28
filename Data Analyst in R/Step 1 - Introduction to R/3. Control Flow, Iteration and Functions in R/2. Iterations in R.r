## 3. The for Loop ##

millimeter_measurements <- c(10000, 54900, 94312, 49185, 2100)
meter_measurements <- c()
for (measurement in millimeter_measurements) {
  meter <- measurement / 1000
  meter_measurements <- c(meter_measurements, meter)
}

## 4. Another Way To Write for Loops ##

millimeter_measurements <- c(10000, 54900, 94312, 49185, 2100)
meter_measurements <- integer(length(millimeter_measurements))
indices <- 1:length(millimeter_measurements)

for (i in indices) {
  calc <- millimeter_measurements[i] / 1000
  meter_measurements[i] <- calc
}

## 7. Your Own while Loop ##

prices <- c(138.19, 82.72, 118.97, 77.55, 62.28, 89.71, 97.36, 91.98, 113.45, 73.93)
is_below_70 <- FALSE
i <- 1
while (!is_below_70) {
  current_price <- prices[i]
  is_below_70 <- current_price < 70
  i = i + 1
}

buy_price <- current_price