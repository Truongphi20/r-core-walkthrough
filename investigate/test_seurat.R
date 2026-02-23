library(Seurat)

# Small built-in test dataset
data("pbmc_small")

# Standard workflow
pbmc_small <- NormalizeData(pbmc_small, verbose = FALSE)
pbmc_small <- FindVariableFeatures(pbmc_small, verbose = FALSE)
pbmc_small <- ScaleData(pbmc_small, verbose = FALSE)

# PCA (calls C++ via Rcpp/Eigen)
pbmc_small <- RunPCA(pbmc_small, npcs = 5, verbose = FALSE)

# Nearest neighbor search (calls C++)
pbmc_small <- FindNeighbors(pbmc_small, dims = 1:5, verbose = FALSE)

# Clustering (C++ involved)
pbmc_small <- FindClusters(pbmc_small, verbose = FALSE)

print("DONE")