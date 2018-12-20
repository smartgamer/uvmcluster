

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
uvmClus5 <- kmeans(rnat, 5)

uvmClus1$cluster
uvmClus1$size
uvmClus1$centers

table(uvmClus1$cluster, rnat$"8314")

rnat$"8314"
rnat$"10431"








