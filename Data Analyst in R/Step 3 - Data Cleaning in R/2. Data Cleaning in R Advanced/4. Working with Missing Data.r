## 1. Introduction ##

library(readr)

mvc  <-  read_csv("nypd_mvc_2018.csv")
na_logical  <-  is.na(mvc)

## 2. Summing Values Over Rows ##

library(dplyr)

mvc_na <- data.frame(is.na(mvc))
mvc_na_injured <- mvc_na %>%
    mutate(total_na_injured = rowSums(.[9:11]))

## 3. Verifying the Total Columns ##

killed  <-  mvc %>% select(ends_with("_killed"))
killed_non_eq <- killed %>% 
    mutate(manual_sum = rowSums(.[1:3])) %>%
    filter(manual_sum != total_killed | is.na(total_killed))

## 4. Filling and Verifying the Killed and Injured Data ##

# fix the killed values
killed_non_eq <- killed_non_eq %>%
    mutate(total_killed = if_else(is.na(total_killed), manual_sum, total_killed ))

killed_non_eq <- killed_non_eq %>%
    mutate(total_killed = if_else(total_killed != manual_sum, NaN, total_killed ))

# Create an injured_non_eq dataframe and manually sum values
injured  <-  mvc %>% select(ends_with("_injured"))

injured_non_eq <- injured %>% 
    mutate(manual_sum = rowSums(.[1:3])) %>%
    filter(manual_sum != total_injured | is.na(total_injured))
injured_non_eq <- injured_non_eq %>%
    mutate(total_injured = if_else(is.na(total_injured), manual_sum, total_injured ))


injured_non_eq <- injured_non_eq %>%
    mutate(total_injured = if_else(total_injured != manual_sum, NaN, total_injured ))

## 5. Preparing Data for Missing Data Visualization ##

library(purrr)

mvc_na <- map_df(mvc, function(x) as.numeric(is.na(x)))
library(tidyr)
                 
mvc_na_heat <- mvc_na %>%
    pivot_longer(cols = everything(),
               names_to = "x") %>%
    group_by(x) %>%
    mutate(y = row_number())

## 6. Visualizing Missing Data with Heatmaps ##

plot_na_matrix <- function(df) {
    # Preparing the dataframe for heatmaps 
    df_heat <- df %>%
        pivot_longer(cols = everything(),
               names_to = "x") %>%
        group_by(x) %>%
        mutate(y = row_number())
    
    # Ensuring the order of columns is kept as it is
    df_heat <- df_heat %>%
        ungroup() %>%
        mutate(x = factor(x,levels = colnames(df)))
    
    # Plotting data
    g <- ggplot(data = df_heat, aes(x=x, y=y, fill=value)) + 
        geom_tile() + 
        theme(legend.position = "none",
              axis.title.y=element_blank(),
              axis.text.y =element_blank(),
              axis.ticks.y=element_blank(),
              axis.title.x=element_blank(),
              axis.text.x = element_text(angle = 90, hjust = 1))
    
    # Returning the plot
    g
}
library(ggplot2)

mvc_na_vehicle <- mvc_na %>% select(contains("vehicle"))
plot_na_matrix(mvc_na_vehicle)

## 7. Visualizing Correlation Matrix with Heatmaps ##

#plot na correlation helper
plot_na_correlation <- function(df) {
    # Taking the lower triangle of the correlation matrix
    missing_corr_up <- df
    missing_corr_up[lower.tri(missing_corr_up)] <- NA
    missing_corr_up <- data.frame(missing_corr_up)
    
    # Preparing the dataframe for heatmaps 
    col_names <- colnames(missing_corr_up)
    
    missing_corr_up_heat <- missing_corr_up %>%
        pivot_longer(cols = everything(),
               names_to = "x") %>%
        group_by(x) %>%
        mutate(y = col_names[row_number()])  %>%
        na.omit
    
    # Ordering triangle
    ordered_cols_asc <- col_names[order(colSums(is.na(missing_corr_up)))]
    ordered_cols_desc <- col_names[order(-colSums(is.na(missing_corr_up)))]
    
    missing_corr_up_heat <- missing_corr_up_heat %>%
        ungroup() %>%
        mutate(x = factor(x,levels = ordered_cols_asc)) %>%
        mutate(y = factor(y,levels = ordered_cols_desc))
    
    # Plotting heatmaps
    g <- ggplot(data = missing_corr_up_heat, aes(x=x, y=y, fill=value)) + 
        geom_tile() + 
        geom_text(aes(label=value)) +
        theme_minimal() +
        scale_fill_gradientn(colours = c("white", "yellow", "red"), values = c(-1,0,1)) +
        theme(legend.position = "none",
              axis.title.y=element_blank(),
              axis.title.x=element_blank(),
              axis.text.x = element_text(angle = 90, hjust = 1))
    
    # Returning the plot
    g
}
mvc_na_vehicle <- mvc_na %>% select(contains("vehicle"))
missing_vehicle_corr  <-  round(cor(mvc_na_vehicle), 2)

plot_na_correlation(missing_vehicle_corr)

## 8. Analyzing Correlations in Missing Data ##

library(purrr)

col_labels  <-  c('v_number', 'vehicle_missing', 'cause_missing')

v_fun <- function(x){ 
    v_col <- paste('vehicle', x,  sep = "_" )
    c_col <- paste('cause_vehicle', x,  sep = "_" )
    sum(is.na(mvc[v_col]) & !is.na(mvc[c_col]))
}
v_na <- map_int(1:5, v_fun )
c_fun <- function(x){ 
    v_col <- paste('vehicle', x,  sep = "_" )
    c_col <- paste('cause_vehicle', x,  sep = "_" )
    sum(!is.na(mvc[v_col]) & is.na(mvc[c_col]))
}
c_na <- map_int(1:5, c_fun )

vc_na_df  <-  tibble(1:5, v_na, c_na)
colnames(vc_na_df) <- col_labels

## 9. Finding the Most Common Values Across Multiple Columns ##

vehicles  <-  mvc %>% select(starts_with("vehicle_"))
head(vehicles)
library(tidyr)

vehicles_1d  <-  vehicles %>% pivot_longer(cols = everything())

vehicles_counts  <-  table(vehicles_1d$value)
top10_vehicles  <-  head(sort(vehicles_counts, decreasing = T), 10)

top10_vehicles

## 10. Filling Unknown Values with a Placeholder ##

v_fun <- function(x){ 
    v_col <- paste('vehicle', x,  sep = "_" )
    c_col <- paste('cause_vehicle', x,  sep = "_" )
    sum(is.na(mvc[v_col]) & !is.na(mvc[c_col]))
}

c_fun <- function(x){ 
    v_col <- paste('vehicle', x,  sep = "_" )
    c_col <- paste('cause_vehicle', x,  sep = "_" )
    sum(!is.na(mvc[v_col]) & is.na(mvc[c_col]))
}

summarize_missing <- function(){
    library(purrr)
    
    col_labels  <-  c('v_number', 'vehicle_missing', 'cause_missing')
    
    v_na <- map_int(1:5, v_fun )
    c_na <- map_int(1:5, c_fun )
    
    vc_na_df  <-  tibble(1:5, v_na, c_na)
    colnames(vc_na_df) <- col_labels
    vc_na_df
}

summary_before  <-  summarize_missing() 

# for (x in 1:5 ){
#    v_col <- paste('vehicle', x,  sep = "_" )
#    c_col <- paste('cause_vehicle', x,  sep = "_" )
for (x in 1:5 ){
    v_col <- paste('vehicle', x,  sep = "_" )
    c_col <- paste('cause_vehicle', x,  sep = "_" )
    
    # create a logical vector for each column
    v_missing_logical  <-  is.na(mvc[v_col]) & !is.na(mvc[c_col])
    c_missing_logical  <-  !is.na(mvc[v_col]) & is.na(mvc[c_col])
    
    # replace the values matching the logical vector for each column
    mvc <- mvc %>%
        mutate_at(c(v_col), function(x) if_else(v_missing_logical,"Unspecified", v_col ))
    
    mvc <- mvc %>%
        mutate_at(c(c_col), function(x) if_else(c_missing_logical,"Unspecified", c_col ))
}

summary_after  <-  summarize_missing()

## 12. Imputing Location Data ##

library(readr)

sup_data  <-  read_csv('supplemental_data.csv')

location_cols  <-  c('location', 'on_street', 'off_street', 'borough')
na_before  <-  colSums(is.na(mvc[location_cols]))
for (col in location_cols ) {
    mvc[is.na(mvc[col]),col] <- sup_data[is.na(mvc[col]),col]
}

na_after  <-  colSums(is.na(mvc[location_cols]))