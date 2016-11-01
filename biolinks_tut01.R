# Example taken from: https://rdrr.io/bioc/TCGAbiolinks/man/GDCdownload.html

library(TCGAbiolinks)
query <- GDCquery(project = "TCGA-ACC",
                  data.category = "Copy number variation",
                  legacy = TRUE,
                  file.type = "hg19.seg",
                  barcode = c("TCGA-OR-A5LR-01A-11D-A29H-01", "TCGA-OR-A5LJ-10A-01D-A29K-01"))
# data will be saved in GDCdata/TCGA-ACC/legacy/Copy_number_variation/Copy_number_segmentation
GDCdownload(query, method = "api")
query <- GDCquery(project = "TARGET-AML",
                  data.category = "Transcriptome Profiling",
                  data.type = "miRNA Expression Quantification",
                  workflow.type = "BCGSC miRNA Profiling",
                  barcode = c("TARGET-20-PARUDL-03A-01R","TARGET-20-PASRRB-03A-01R"))
# data will be saved in:
# example_data_dir/TARGET-AML/harmonized/Transcriptome_Profiling/miRNA_Expression_Quantification
example.data.dir <- Sys.getenv('TCGA_DATA_DOWNLOADS_DIR')
GDCdownload(query, method = "client", directory = example.data.dir)
query <- GDCquery(project = "TCGA-COAD", data.category = "Clinical")
GDCdownload(query, chunks.per.download = 200)
