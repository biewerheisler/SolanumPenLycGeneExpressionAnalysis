# SolanumPenLycGeneExpressionAnalysis
This repository contains the code and data used in the analysis of S. lycopersicum and S. pennellii pollen, style, and leaf gene expression, and pollen phenotypes in-vitro and in-vivo.

The main code is all in PMERNAseqDeseq.Rmd. Old versions of the code, 
with obsolete sections, exist across timRNAseq_deseq2.Rmd, timRNAseq_deseq2.Rmd, 
and tissue_specific.Rmd.

Scripts used by Matthew Gibson for preprocessing are in scripts.

Figures are pdf files in the folder FiguresForSubmission

Data files include:

Supplement_BHetalTBD.xlsx = Supplemental tables referenced in the main text.

OriginalData
	-pen_lyc_readcounts.txt = The read counts for all tissues and replicates
	-LycoPMEPMEI.csv = The PME and PMEI gene IDs in the S. lycopersicum genome.
	-InplantaPollenTubeGrowth.csv = In-vivo (in planta) pollen tube growth data
	-LycoPennPollenTubeGrowthAsssay.csv = In-vitro pollen tube growth data
	-UnFrozenLycoPennInVitro.csv = In-vitro pollen tube growth using never-frozen pollen
 
OriginalImages
	-InVitroImages = Images of in-vitro pollen tube growth
	-InVivoImages = Images of in-vivo pollen tube growth, original images and images stitched together
	-UnfrozenPollenInVitroTests = Images of in-vitro pollen tube growth using never-frozen pollen
 
ProcessedData
	-designMatrixNoGermStyle.csv = design matrix for deseq2 used in publication
	-hyp_tests_GoodPollenStyle.csv = results of deseq2 tests, used in publication
	-LycPenTPM.csv (and associated files) = data normalized as TPM
	-masterDF.txt (and associated files) = data and added information used as the basis for downstream analyses
	-specificDataset.csv = old data, unused, that was intended for determining which genes are specifically expressed in each tissue. Tau was used in favor of this method


