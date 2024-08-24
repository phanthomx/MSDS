library(dplyr) 
library(ggplot2) 
install.packages("dplyr")
install.packages("ggplot2")
set.seed(123)
customers <- data.frame(
  customer_id = 1:100,
  total_spend = runif(100, min = 100, max = 1000),
  total_orders = sample(1:10, 100, replace = TRUE),
  tenure_months = sample(12:120, 100, replace = TRUE)
)
print(customers)

print(head(customers))
avg_purchase_value = customers$total_spend /customers$total_orders
print(avg_purchase_value)
purchase_frequency = customers$total_orders / customers$tenure_months
print(purchase_frequency)
clv = avg_purchase_value * purchase_frequency * customers$tenure_months
head(clv)
ggplot(customers, aes(x = clv)) + geom_histogram(binwidth = 50, fill = "blue", color = "black") + labs(title = "Distribution of CLV",x = "Customer Lifetime Value",y = "Frequency") +theme_minimal()
summary(customers$clv)

