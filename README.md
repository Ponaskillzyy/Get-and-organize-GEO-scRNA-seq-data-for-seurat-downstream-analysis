# Get-and-organize-GEO-scRNA-seq-data-for-seurat-downstream-analysis

This is a practice that allow users to download and organize scRNA seq data from GEO for Seurat downstream analysis. All codes are written in R.
If pratice is used appropriately, the results are anticipated;

- GEO data will be downloaded based on user given GEO number
- Notably, the downloaded file is compressed and wound be untar 
- Subdirectories would be created and annotated based on the individual samples in the GEO data
- Required files per sample including _barcodes.tsv.gz, _genes.tsv.gz, and _matrix.mtx.gz will be copied into corresponding subdirectories.
- All files not in atleast a subdirectory will be deleted.

