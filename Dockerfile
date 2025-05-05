# Use a base image with R and common data science packages pre-installed
# rocker/tidyverse includes R, tidyverse, and other useful tools
FROM rocker/tidyverse:latest

# Install necessary R packages from CRAN
# We use Rscript to run R commands non-interactively
RUN Rscript -e 'install.packages(c("Seurat", "SeuratDisk"), repos="https://cran.rstudio.com/")'

# Set the working directory inside the container
WORKDIR /app

# Copy the R conversion script into the container
# Assuming the script is named Rconversion.R and is in the specified path
COPY SeuratConversion/withSeuratDisk/Rconversion.R ./Rconversion.R

# (Optional) Copy example data if needed for testing within the container
# COPY SeuratConversion/withRestAPI/pbmc3k_filtered_gene_bc_matrices /app/pbmc3k_example

# Make the script executable (optional, but good practice)
RUN chmod +x ./Rconversion.R

# Define the default command to run when the container starts
# This assumes your R script takes input and output paths as arguments
# For example: Rscript Rconversion.R /path/to/input.h5Seurat /path/to/output.h5ad
# Users will need to mount their data volumes when running the container
ENTRYPOINT ["Rscript", "./Rconversion.R"]

# You can add metadata to the image (optional)
LABEL description="Docker image for Seurat to AnnData conversion using R and SeuratDisk"
LABEL maintainer="Your Name <your.email@example.com>"
