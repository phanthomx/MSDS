install.packages("tidyverse")
library(tidyverse)
install.packages("arules")
library("arules")
install.packages("arulesViz")
library("arulesViz")
library(dplyr)
search()
archive <- read_csv("D:\\MSDS\\R\\archive.zip")
View(archive)
head(archive)
str(archive)
colnames(archive)
data <- archive %>% dplyr::rename(transaction_id = 'TransactionId', item_id = 'ItemCode')
names(archive)[names(archive) == 'TransactionId'] <- 'transaction_id'
names(archive)[names(archive) == 'ItemCode'] <- 'item_id'
transactions_list <- split(archive$item_id, archive$transaction_id)
transactions <- as(transactions_list, "transactions")
summary(transactions)
frequent_itemsets <- apriori(transactions, parameter = list(support = 0.01, target = "frequent itemsets"))
print(frequent_itemsets)
inspect(frequent_itemsets)
rules <- apriori(transactions, parameter = list(support = 0.01, confidence = 0.5, target = "rules"))
inspect(rules)
rules <- sort(rules, by = "lift", decreasing = TRUE)
inspect(rules[1:10])
rule <- rules[1]
support(rule)
rules <- sort(rules, by = "lift", decreasing = TRUE)
inspect(rules[1:5])
inspect(rules[1:5])
rule_metrics <- quality(rules)
print(rule_metrics[1, ])
support_value <- rule_metrics$support[1]
print(paste("Support: ", support_value))
confidence_value <- rule_metrics$confidence[1]
lift_value <- rule_metrics$lift[1]
print(paste("Confidence: ", confidence_value))
print(paste("Lift: ", lift_value))


