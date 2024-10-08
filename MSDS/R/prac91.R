install.packages("ggplot2")
library(ggplot2)
install.packages("ggplot2",dependencies = TRUE)
library(ggplot2)
install.packages("cluster")
library(cluster)
data("iris")
names(iris)
new_data<-subset(iris,select = c(-Species))
new_data
cl=kmeans(new_data,3)
data <- new_data
wss <- sapply(1:15,function(k){kmeans(data,k)$tot.withinss})
wss
plot(1:15,wss,type="b",pch=19,frame=FALSE,xlab="Number of cluster k",ylab = "Total within-cluster sum of squares")

clusplot(new_data , cl$cluster , color=TRUE , shade=TRUE , labels = 2 , line=0)
cl$cluster
cl$clusters
"agglomarative clustering"
cluster <- hclust(dist(iris[,3:4]))
plot(cluster)
clusterCut <- cutree(cluster,3)
table(clusterCut,iris$Species)
# Hierarchical clustering
cluster <- hclust(dist(iris[, 3:4]), method = 'average')
clusterCut <- cutree(cluster, 3)  # Assuming 3 clusters



ggplot(iris,aes(Petal.Length,Petal.Width,color=iris$Species))+
  geom_point(alpha=0.4,size=3.5)+
  geom_point(col=clusterCut)+
  scale_color_manual(values=c('black','red','green'))
cluster <- hclust(dist(iris[,3:4]),method = 'average')
clusterCut1 <- cutree(cluster,3)
table(clusterCut1,iris$Species)
plot(cluster)

ggplot(iris,aes(Petal.Length,Petal.Width,color=iris$Species))+
  geom_point(alpha=0.4,size=3.5)+
  geom_point(col=clusterCut1)+
  scale_color_manual(values=c('pink','red','yellow'))
