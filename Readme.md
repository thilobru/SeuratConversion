# Script for transforming files between formats readable by scanpy and seurat

to start the transformation, execute following command:
`Rscript Rconversion.R [filename]`
here filename should be replaced with the name of a file encoded as h5Seurat or h5ad.

The R script will detect which direction the conversion should take and create a corresponding file in the other format with the same name and different ending.

To execute Seurat and SeuratDisk need to be available in R. They will be automatically installed when running the script but R must already be installed.