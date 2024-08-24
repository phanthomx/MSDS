library(dplyr) # for data manipulation
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
avg_spend_per_order <- customers$total_spend / customers$total_orders
print(avg_spend_per_order)
print(head(avg_spend_per_order))
customers$high_spender <- ifelse(avg_spend_per_order > 200, 1, 0)
print(customers$high_spender)
print(head(customers$high_spender))
customers$high_spender <- factor(customers$high_spender, levels = c(0, 1), labels = c("Not High Spender", "High Spender"))
logit_model <- glm(high_spender ~ total_orders + tenure_months, data = customers, family = "binomial")
print(logit_model)
summary(logit_model)
ggplot(customers, aes(x = total_orders, y = tenure_months, color = high_spender)) +geom_point() +  
geom_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE) +  labs(title = "Logistic Regression: Predicting High Spenders", x = "Total Orders",
 y = "Tenure Months",color = "High Spender") +scale_color_manual(values = c("blue", "red")) + 
  theme_minimal()  # Minimal theme
install.packages('ggplot2')

