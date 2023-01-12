#---------------------------------------------------------------------------------------
#  Objectives: To download scRNA seq data from GEO,
#  create folder for each samples in raw data,
#  organize gene, barcode and matrix file per sample into their corresponding folder
#---------------------------------------------------------------------------------------

#Load libraries
suppressWarnings(suppressPackageStartupMessages({ 
  library(GEOquery) 
  library(stringr)}))


#GSE139324 is the sample GEO number

#set working directory
setwd("/Users/prosperchukwuemeka/Documents/Project_CCL1")

#Get data from GEO
gds <- GEOquery::getGEO("GSE139324")
GEOquery::getGEOSuppFiles(GEO = "GSE139324", makeDirectory = T, baseDir = getwd(), fetch_files = T) 

#change working directory to GSE139324
setwd(paste0(getwd(), "/GSE139324"))

#untar downloaded file
untar(paste0(getwd(), "/GSE139324_RAW.tar"))

#delete the downloaded tar file 
unlink(list.files()[[1]])

#get list of files in current working directory
data <- list.files(getwd())

#remove unwanted strings and create sub-directory
data.subdir <- gsub("_barcodes.tsv.gz|_genes.tsv.gz|_matrix.mtx.gz","", data)
sapply(data.subdir, dir.create)

#copy files to corresponding directory
for(i in unique(data.subdir)){
  
  file.copy(from = paste0(i, str_extract(list.files(getwd()), "_matrix.mtx.gz|_barcodes.tsv.gz|_genes.tsv.gz")), 
            to = paste0(getwd(), "/", i))
  
}


#delete all files except sub-folders containing data
for(i in list.files(getwd())){ if (str_detect(i, "_matrix.mtx.gz|_barcodes.tsv.gz|_genes.tsv.gz")) {
  
  unlink(i)
}
}





