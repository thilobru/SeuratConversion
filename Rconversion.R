# # install Seurat
if (!requireNamespace("Seurat", quietly = TRUE)) {
  install.packages("Seurat")
}

if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
if (!requireNamespace("SeuratDisk", quietly = TRUE)) {
  remotes::install_github("mojaveazure/seurat-disk")
}

library(Seurat)
library(SeuratDisk)

args = commandArgs(trailingOnly = TRUE)
args <- "pbmc3k.h5ad"
# test if there is at least one argument: if not, return an error
if (length(args) == 0) {
  stop("At least one argument must be supplied (input file)", call. = FALSE)
} else if (length(args)==1) {
  if (endsWith(args, ".h5Seurat")){
    # default output file
    Convert(args, dest = "h5ad", overwrite = TRUE)
  } else if (endsWith(args, ".h5ad")) {
    Convert(args, dest = "h5Seurat", overwrite = TRUE)
  } else {
    stop("filename is not recognized. Should end with .h5Seurat or .h5ad")
  }
} else if (length(args) > 1) {
  stop("more than one argument was supplied. Please only specify the input"
       , call. = FALSE)
}