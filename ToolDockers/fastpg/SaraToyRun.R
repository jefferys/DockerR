#!/usr/bin/env Rscript

# R code
suppressPackageStartupMessages(library(flowCore))
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(RANN))
suppressPackageStartupMessages(library(Rcpp))
suppressPackageStartupMessages(library(RcppParallel))
suppressPackageStartupMessages(library(igraph))
suppressPackageStartupMessages(library(nmslibR))
suppressPackageStartupMessages(library(mclust))
suppressPackageStartupMessages(library(MLmetrics))

args = commandArgs( trailingOnly= TRUE )
if ( length(args) == 0 ) {
  stop( "Missing argument: FCS file name.", call.= FALSE )
}
fcsFile <- args[[1]]
if (! file.exists(fcsFile) ) {
  stop( paste0( "Can't find FCS file: \"", fcsFile, "\"" ), call.= FALSE )
}

# format FCS file
l<-as.data.frame(exprs(read.FCS(fcsFile)))
l<-l[which(!is.na(l$label)),]
sourceCpp(file = "/usr/local/fastpg/parallel_jc2.cpp")

# subsample
s<-sample(dim(l)[1],50000)
l32s<-l[s,]
l32s<-l32s[order(l32s$label),]
dat<-as.matrix(l32s[,5:36])

ind<-NULL
nm1<-system.time(init_nms <- NMSlib$new(input_data=dat, space='l2', method='hnsw'))

message( "Time - NMSlib$new call: ", nm1 )

res <- init_nms$knn_Query_Batch(dat, k=30, num_threads=5)
ind<-res$knn_idx

links <- rcpp_parallel_jce(ind)
relations <- as.data.frame(links)
colnames(relations) <- c("from","to","weight")

relations <- relations[!(relations$from==0 | relations$to==0 | relations$weight==0),]
write.table( relations, file= "out.tsv", sep="\t", quote= F, row.names = F)
