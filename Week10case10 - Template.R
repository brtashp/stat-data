###Week10 case 10 solution###
# goal: divide digital images to salient regions/clusters 
# corresponding to individual surfaces, objects, or 
# natural parts of objects 

#1. Load the data
data = read.csv("Week10_flower.csv", header=FALSE)

#2. Review the structure of the data
str(data)

#3. Change the data type to matrix
flowerMatrix = as.matrix(data)

#4. Review the structure of the data
str(flowerMatrix)

#5. Turn matrix into a vector
flowerVector = as.vector(flowerMatrix)

#6. Review the structure of the data
str(flowerVector)

#7. Compute distances
distance = dist(flowerVector, method ="euclidean")

#8. Hierarchical clustering
clusterIntensity = hclust(distance, method="")

#9. Plot the dendrogram
plot(clusterIntensity)

#10. Select 3 clusters
rect.hclust(clusterIntensity, k=3, border="red")

#11. Separate the data into the 3 clusters selected
flowersClusters = cutree(clusterIntensity, k=3)
flowersClusters

#12. Find mean intensity values
tapply(flowerVector, flowersClusters, mean)

#13. Plot the image and the clusters
dim(flowersClusters)=c(50,50)
image(flowersClusters, axes=FALSE)

#14. Original image
image(flowerMatrix, axes=FALSE)

#15. Let's use KMC. Specify number of clusters
k = 3

#16. Run k-means
set.seed(1)
KMC=kmeans

#17. Extract clusters


#18. Plot the image with the clusters
dim(KMC)

