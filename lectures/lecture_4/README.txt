
GENERAL INFORMATION
This README.txt file was updated on 1st September 2023  

A. Paper associated with this archive
Citation
	Herrera, C. M. Plant phenotypes as distributions: Johannsen's beans revisited. The American Naturalist
Abstract:
	In the early 20th century, Wilhelm Johannsen's breeding experiments on pure lines of beans provided empirical support for his ground-breaking distinction between phenotype and genotype, the foundation stone of classical genetics. In contrast with the controversial history of the genotype concept, the notion of phenotype has remained essentially unrevised since then. The application of the Johannsenian concept of phenotype to modularly-built, nonunitary plants, however, needs re-examination. In the first part of this article it is shown that Johannsen's appealing solution for dealing with the multiplicity of non-identical organs produced by plant individuals (representing individual plant phenotypes by arithmetic means), which has persisted until our days, reflected his intellectual commitment to 19th-century typological thinking. Revisitation of Johannsen's results using current statistical tools upholds his major conclusion about the nature of heredity, but at the same time falsifies two important ancillary conclusions of his experiments, namely the alleged homogeneity of pure lines (genotypes) regarding seed weight variability and the lack of transgenerational effects of within-line (within-genotype) seed weight variation. The canonical notion of individual plant phenotypes as arithmetic means should therefore be superseded by a concept of phenotype as a dual property, consisting of central tendency and variability components of organ trait distribution. Phenotype duality offers an unifying framework applicable to all nonunitary organisms.
B. Originators
	Carlos M. Herrera, Estación Biológica de Doñana, CSIC
C. Contact information
	Carlos M. Herrera
	Estación Biológica de Doñana, CSIC,
	Avda. Americo Vespucio 26, E-41092 Sevilla, Spain
	e-mail: herrrera@ebd.csic.es
D. Dates of data collection
	Not applicable, data are extracted from an earlier publication (Johannsen 1903)
E. Geographic Location(s) of data collection
	Not applicable, data are extracted from an earlier publication (Johannsen 1903) 
F. Funding Sources
	FocScales, PROMETEO-2021/040.
	EPINTER, PID2019-104365GB-I00

ACCESS INFORMATION
1. Licenses/restrictions placed on the data or code
	Attribution 4.0 International (CC BY 4.0)
2. Data derived from other sources
	All the data were taken from Johannsen (1903)
3. Recommended citation for this data/code archive
	Herrera, C. M. 2023. Data and R code used in the reanalysis of Johannsen's bean experiments. figshare. Dataset. https://dx.doi.org/10.6084/m9.figshare.22639861

DATA & CODE FILE OVERVIEW
This data repository consist of 2 data files, 1 code script, and this README.txt document, with the following data and code filenames and variables

Data files and variables
    1. Johannsen.dataset1.csv [line, class.seed.mother, mean.seed.progeny, stdev.seed.progeny, freq]
    This dataset includes results of experiments for each pure line showing the mean and standard deviation of seed weight, broken down by the weight class of the initial mother seeds ("Muttersamen", 1901 crop) (Johannsen 1903, p. 21-24, tables Linie A through Linie T). Detailed information on the variables to be found in the original source.
    2. Johannsen.dataset2.csv [line, class.seed.progeny, freq]
    This dataset consists of the distribution of seeds among weight classes, separately for each pure line (Johannsen 1903, Uebersichtstabelle I, p. 25). Detailed information on the variables to be found in the original source.
    
Code scripts
    1. Script.R 
    This script performs the reanalysis of Johannsen's experimental results and plots Figs 1 to 3. 
    
SOFTWARE VERSIONS

R 4.2.2 and RStudio 2022.07.2 Build 576.

REFERENCES

Johannsen, W. 1903. Ueber Erblichkeit in Populationen und in reinen Linien: ein Beitrag zur Beleuchtung schwebender Selektionsfragen. Gustav Fischer, Jena, Germany.


