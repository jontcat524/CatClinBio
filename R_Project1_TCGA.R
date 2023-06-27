#Catchpole Clinical Bioinformatics Project 1#

#Pre-work: Select libraries to use for project
library(BiocManager)
library(TCGAbiolinks)
library(maftools)
library(pheatmap)
library(tidyverse)

#get a list of projects#
gdcprojects <- getGDCprojects()


#Looking at consistency of TCGA Colon Cancer study
COAD_Summary <- getDataCategorySummary('TCGA-COAD')


#Builiding a query for Expression Data, specifically RNA Seq
queryTCGA <- GDCquery(project = 'TCGA-COAD', 
                      data.category = 'Transcriptome Profiling',
                      experimental.strategy = 'RNA-Seq',
                      workflow.type = 'STAR - Counts',
                      access = 'open')

#Overview of open access TCGA Colon RNA Seq files we can download
output_query <- getResults(queryTCGA)


#Downloading Files into R
#GDCdownload()