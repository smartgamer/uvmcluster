

rna = read.csv("data_RNA_Seq_v2_expression_median.txt", sep = "\t", stringsAsFactors = F)
row.names(rna)=rna$Entrez_Gene_Id
str(rna)
rna[1:6,1:6]
table(rna$TCGA.V3.A9ZX.01, useNA = "ifany")
summary(rna$TCGA.V3.A9ZY.01)
mean(rna$TCGA.V3.A9ZY.01)  # there's no "NA"

rnat=t(rna[-c(1,2)])  #all numeric, then transpose.
rnat[1:6,1:6]

set.seed(1001)
uvmClus1 <- kmeans(rnat, 2)
uvmClus2 <- kmeans(rnat, 3)
uvmClus5 <- kmeans(rnat, 5, nstart = 20)

uvmClus1$cluster
uvmClus1$size
uvmClus1$centers

which(colnames(rnat)=="8314") #find which column is BAP1 (Entrez geneid=8314)
table(uvmClus1$cluster, rnat[,1387])


"8314" %in% colnames(rnat)

head(rnat[,1387])

library(ggplot2)
uvmClus1$cluster <- as.factor(uvmClus1$cluster)
rnatd=as.data.frame(rnat)
ggplot(rnatd, aes(rnatd$"1387", rnatd$"1388", color = uvmClus1$cluster)) + geom_point()

ggplot(rnatd, aes(rnatd$"1387", rnatd$"1388", color = uvmClus5$cluster)) + geom_point()

colnames(rnat)[1388]
rnatd[1387:1388]

rnatd$cluster=uvmClus1$cluster
rnatd[c(1387:1388, 20532)]
