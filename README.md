# M2 Internship Sharks

![corax](https://user-images.githubusercontent.com/80922475/148587803-c273aba5-0806-4ab7-93c0-1cd7e21854c3.jpeg)
### *Squalicorax* a cretaceous lamniformes

## Abstract

The purposes of the several script I intended to write were to give a fast and comprehensive way for  **any** mitogenomic datamining, and giving the user a fast way to obtain a maximum likelyhood phylogeny.
One must understand that this code **only** on linux system, and need several minor modification to work properly on MAC OS.
Also this pipeline remain highly experimental so I understand that many uppgrade can be conducted.
Finally, this programm automatised the vast majority of datamining, but several steps of check must be conducted unless you do not mind having a messy alignment and a messier phylogeny at the end.

## Prerequisite

To work the masterscript need the user to have installated the following programms:

  - Entrez Direct (Kans, 2013)
   
   `sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"` 
   
   `echo "export PATH=\$PATH:\$HOME/edirect" >> $HOME/.bash_profile`
   
  - muscle (Edgar, 2004)
    
    `sudo apt-get install muscle`
    
  - Emboss (Rice et al. 2000)
    
    `sudo apt-get install emboss`
    
  - python3
    - module Bio (Cock et al. 2009)
    
    `pip install Bio`
    - module sys
    
    `pip install sys`
  - IQ-TREE (Minh et al. 2020)
    
    `sudo apt-get install iqtree2`
  - seqkit (Shen et al. 2016)
    
    `brew install seqkit`
  - MACSE (Ranwez et al. 2011)

    The code use MACSE version 2.06 "macse_v2.06.jar"
 
  **ONLY for MS2.sh**
  - Manually download one reference genome whose purpose is to adjust the size of the incomplete sequence, and put it into a newly created folder called **reference**. If you'll have to choose a reference genome, I higlhy recommend Refseq genome, from the ncbi.
  
## Getting started

Along the instruction we are going to study two ways to obtain a phylogeny for the following specie dataset :

*Prionace glauca* (Carcharhiniformes)

![Prionace](https://user-images.githubusercontent.com/80922475/154267036-ec7431e2-8021-46fb-9668-8e24ca5c331f.jpg)

*Rhincodon typus* (Orectolobiformes)

![Rhincodon](https://user-images.githubusercontent.com/80922475/154267816-7afcf250-337e-42b5-8ec4-a3f7c1fbe372.jpeg)

*Carcharodon carcharias* (Lamniformes)

![Carcharodon](https://user-images.githubusercontent.com/80922475/154267478-49627018-b02b-401c-8b64-7010e92991e7.jpeg)

*Squatina squatina* (Squatiniformes)

![Squatina](https://user-images.githubusercontent.com/80922475/154269009-3d6a1333-5915-4579-8452-d76f1a2385eb.jpg)

*Hexanchus griseus* (Hexanchiformes)

![Hexanchus](https://user-images.githubusercontent.com/80922475/154269010-97493fde-35b2-41db-b5be-fdb152e8ea55.jpg)

*Squalus acanthias* (Squaliformes)

![Squalus](https://user-images.githubusercontent.com/80922475/154268997-0bc01859-76ae-49d4-adc8-86e3e448b90b.jpg)

*Heterodontus zebra* (Heterodontiformes)

![Heterodontus](https://user-images.githubusercontent.com/80922475/154269004-fa41a2ae-d9fd-4f94-89f8-80692ffda38d.jpg)

*Pristiophorus japonicus* (Pristiophoriformes)

![Pristiophorus](https://user-images.githubusercontent.com/80922475/154267653-33117072-f8c0-4748-bd18-8cf061fd1df5.jpg)

First the user must specify a species list into your current directory. The list is call list.txt and you must specify the species name in the same way that in the following example : 

![list](https://user-images.githubusercontent.com/80922475/154270445-dcae2558-e269-41f4-9606-9e3aa8020da8.png)

Two master script are presented here:

## I Fast phylo

  The first one is the quickest of the two and lack many steps of checking but remain the best way to have a quick and dirty phylogeny.
  One must pay attention to the data availabilty, because the code will function only for species with refseq mitogenome.
  
  To start the script, the user have just to run the following command line in the directory downloaded from this git : `bash QD.sh`
  Only this command is necessary and the user will have literally **nothing** to do. Running this analysis took me 5 minutes only.
  
  At the end you will find several file corresponding to the output of Iqtree, comprising a contree.file in the "last" folder, which is the consensus tree from the maximum likelyhood analysis.
  
  I higly recomand the use of figtree as a tree visualizer for the consensus tree as seen in this example
    
![my_aligned_sequences fst contree-1](https://user-images.githubusercontent.com/80922475/154271031-c4d610b1-c47f-4391-af4b-2f9bb318f59c.png)
  
## II Complete phylo
  
  The second script is by far the slowest of the two but is far more complex and can handle even incomplete data.
  As such it is not a problem for the user to specify in the list even missing species, because the script will automaticaly remove them.
  It remains possible to run all the command line in one go by typing `bash allin.sh`.
  But I do not recommend this, since some errors can occur and remain at the end of the analysis, resulting in long branch into the phylogeny.
  
  ### a) First step : datamining, first cleaning and consensus
  
  `bash First_step.sh`
  
  To avoid most errors the second master script is in fact divided onto three subscript, here we examine the first one called **First_step.sh**.
  First the subscript will also download mitogenomic data for the specify species in the list, but will be not only restricted to refseq genome.
  
  Extanding the spectrum of available sequence will largely benefit our dataset since most of the sequence of genbank will be either non complete or non-refseq. 
  
  Since multiple sequence will be downloaded for each specie, we will have to choose one among all of them, but can't really know *a priori* which one is the best. We then decided to make a consensus sequence (by calling em_cons) each time multiple sequence were available for the same gene in one specie. Nevertheless scarce error can happen when constituing consensus sequence. The default behavior of the script is to keep the largest sequence among the others as the "backup" sequence, and by doing so, missing data (due to either bad consensus or bad alignement) will be replaced by the backup sequence.
  Also the script will easily incomplete sequence (typically barcode sequence) with N.
  At the end of the script some names of genes and species  will be dispalyed into the terminal. Those names correspond to messy sequence, and need to be monitored manualy. In my experience the messy data are the one from either non-specified reverse complement in the genbank database or contaminated sequences from an other gene/or specie. The fastest way to get rid of this is to replace those problematic sequences by N placeholder generated from the reference directory, but the best way remain to manually complete these sequence by hand and/or to use their reverse-complement.
  
  ### b) Second step : alignement
  
  `bash Second_step.sh`
  
  The second step is the alignement of our sequences, and the sorting of our sequence, which is by far the most time-consumming of all.
  The script will automatically align all the sequence by gene. The programm called here is muscle, but several other alignement programm exist, such as MACSE or Clustalw. In the future version of the script I will certainly be using MACSE for the final alignement instead of muscle for coding sequence, since MACSE is way more effective and keep the open reading frame intact. Even if this process is stil automatized one must check by hand the quality of the alignement. Indeed a messy alignement will result into a phylogeny with abnormally large branch length.
  I recommend the use of Mesquite (Maddison et al. 2016)  as an alignement editor, but even then some sequence will maybe need to be either modified or even removed from the dataset.
  At the end of the data cleaning you will be ready to run the last subscript.
  
  ### c) Last step : Phylogeny
  
  `bash Last_step.sh`
  
  Finally the last subscript is about the tree construction, and is by far the most customizable one. 
  As a tree maker we use the program IQ-TREE, since its option are numerous.
  However, some missing data are still possible (unlikely) , and the user will have to manually remove the species with only missing data.
  
  Many options are associated with IQ-TREE, and if the user want to make a more complete analyze, all the option are referenced in the user guide of Iqtree.
  By doing so, you will have to modify the file **tree.sh** manualy at the last line, and replacing this line with your augumented version.
 
 The complete run took me more than 2 hours but, in my opinion, is far more powerfull. Mostly because incomplete sequence will remain still useful. As for a comparaison if I only took the first script to make my phylogeny, only 100 sequences will be available, on the opposite, with the second code, the phylogeny comprised more than 380 species, so almost 3 times more! (tested on 02/17/21)
 
  ### Reference
  
  Kans, J. 2022. Entrez direct: E-utilities on the UNIX command line. In *Entrez Programming Utilities Help [Internet]*. National Center for Biotechnology Information (US).  

  Edgar, R.C. 2004. MUSCLE: a multiple sequence alignment method with reduced time and space complexity. *BMC Bioinformatics*. 5:113 https://doi.org/10.1186/1471-2105-5-113
  
  Rice, P. Longden, I. Bleasby, A. 2000. « EMBOSS: The European Molecular Biology Open Software Suite ». *Trends in Genetics*. 16(6):276-277 (PMID 10827456, DOI 10.1016/s0168-9525(00)02024-2)
  
  Cock, P. J. Antao, T. Chang, J. T. Chapman, B. A. Cox, C. J. Dalke, A. De Hoon, M. J. 2009. Biopython: freely available Python tools for computational molecular biology and bioinformatics. *Bioinformatics*. 25(11):1422-1423.
  
Minh, B. Q. Schmidt, H. A. Chernomor, O. Schrempf, D. Woodhams, M. D. von Haeseler, A. Lanfear, R. 2020. IQ-TREE 2: New Models and Efficient Methods for Phylogenetic Inference in the Genomic Era. *Molecular biology and evolution*. 37(5):1530–1534. https://doi.org/10.1093/molbev/msaa015  

Shen, W. Le, S. Li, Y. Hu, F. SeqKit: a cross-platform and ultrafast toolkit for FASTA/Q file manipulation. *PloS one*. 11(10). doi:10.1371/journal.pone.0163962.
  
  Ranwez, V. Harispe, S. Delsuc, F. Douzery, E.J.P. 2011. MACSE: Multiple Alignment of Coding SEquences Accounting for Frameshifts and Stop Codons. *PLoS ONE*. 6(9). doi:10.1371/journal.pone.0022594

Maddison, D.R. Wheeler, T.J. Maddison, W.P 2016. Align: a Mesquite package for aligning sequence data. Version 1.8. http://www.mesquiteproject.org/Align.html
