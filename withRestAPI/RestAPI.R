library(plumber)
library(dplyr)
library(ggplot2)
library(gapminder)

#* @apiTitle SeuratExtractAPI
#* @apiDescription API for extracting Seurat Datasets and makingthem available through a Rest API

library(Seurat)
library(dplyr)
library(Matrix)

pbmc.data <- Read10X(data.dir = "~/Documents/seurattoscanpy/RestAPI/pbmc3k_filtered_gene_bc_matrices/")

#* Returns countries that satisfy condition
#* @param in_continent
#* @param in_lifeExpGT Life expectancy greater than
#* @param in_popGT Population greater than
#* @get /countries
function(in_continent, in_lifeExpGT, in_popGT) {
  gapminder %>%
    filter(
      year == 2007,
      continent == in_continent,
      lifeExp > in_lifeExpGT,
      pop > in_popGT
    )
}