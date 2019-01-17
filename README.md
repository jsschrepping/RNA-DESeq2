#  RNA-DESeq2
Template for DESeq2 Analysis of RNA-seq data

The aim was to write a script that can be used as a template for standard bulk RNA-seq analysis. The script covers:

1.  Installation of necessary packages
2.  Project Information
	•   Here, you are supposed to write down all necessary information about the project you are working on! We think this is very important for collaboration partners or other researches working with the data (after your time) to know the background of the project and the preprocessing steps performed!
3.  Obligatory Data Structure
	•   The data to be analyzed has to be in a certain structure, which is pretty much the structure it has coming out of out the preprocessing pipeline. Additionally, you need to download annotation files from a public sciebo folder.
4. Data Import
	•   Gene and Sample Annotation files
	•   Fastq and Kallisto Quality Check
	•   Kallisto Import using TXimport
5. Build DESeq Data Set
	•   Pre-Filtering
	•   Statistical Calculations
	•   Produce normalized Count table
	•   Produce variance-stabilized count table (rlog)
6. Exploratory Data Analysis
	•   Gene Types
	•   Highest Expressed Genes
	•   Heatmaps of all and variable Genes
	•   Correlation and Distance Plots
	•   PCA
	•   Single Gene Expression Box Plot
	•   Heatmap of selected Gene Sets without enrichment
7. Batch Effect Removal (treat with caution!)
	•   In case you observed an obvious batch effect in the data during the exploratory data analysis, this part of the script allows you to estimate the influence of both known and hidden batch effects in a PCA. Batch variables can later be included in the DESeq2 design.
8. Differential expression analysis
	•   Automated DE analysis of specified comparisons
	•   Produces a big list of all the output of the differential expression analysis!
	•   Overall visualization of DE results
		i.  Heatmap of the union of all DE genes
		ii. Venn diagrams
		iii.	 Ratio-Ratio Plots
		iv.	 GSEA across comparisons (incl. GO & KEGG)
	•	 Likelihood Ratio Test
	•	 Analysis of specific comparisons
		i.	 MA plots
		ii.	 P value distribution
		iii.	 Heatmap of DE genes
		iv.	 Volcano Plot
		v.	 GSEA (Incl. GO, KEGG, Hallmark, cannonicalPathways, Motis, ImmunoSignatures)
9. Export of the results
10. Save image and session info
	 
