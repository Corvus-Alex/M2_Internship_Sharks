# M2 Internship Sharks

![corax](https://user-images.githubusercontent.com/80922475/148587803-c273aba5-0806-4ab7-93c0-1cd7e21854c3.jpeg)
### *Squalicorax* a cretaceous lamniformes

## Abstract

The purposes of the several script I intended to write were to give a fast and comprehensive way for mitogenomic datamining, and giving the user a fasta way to obtain a maximum likelyhood phylogeny.
One must understand that this only on UNIX system.
Also this pipeline remain highly experimental so I understand that many uppgrade can be conducted.
Finally, this programm automatised the vast majority of datamining, but several steps of check must be conducted unless you don't mind having a messy alingment and a messier phylogeny at the end.

## Prerequisite

To work the masterscript need the user to have installated the following programms:

  - ENTREZ DIRECT 
  - muscle
  - Emboss
  - python3
  - iqtree2
  - seqkit
 
  *ONLY for MS2.sh*
  - Manually download one reference genome whose purpose is to adjust the size of the incomplete sequence, and put it into a newly created folder called "reference".
  
## Getting started

Along the instruction we are going to study two ways to obtain a phylogeny for the following specie dataset :

Prionace glauca (Carcharhiniformes)

![Prionace](https://user-images.githubusercontent.com/80922475/154267036-ec7431e2-8021-46fb-9668-8e24ca5c331f.jpg)

Carcharodon carcharias (Lamniformes)

![Carcharodon](https://user-images.githubusercontent.com/80922475/154267478-49627018-b02b-401c-8b64-7010e92991e7.jpeg)

Rhincodon typus (Orectolobiformes)

![Rhincodon](https://user-images.githubusercontent.com/80922475/154267816-7afcf250-337e-42b5-8ec4-a3f7c1fbe372.jpeg)

Squatina squatina (Squatiniformes)

![Squatina](https://user-images.githubusercontent.com/80922475/154269009-3d6a1333-5915-4579-8452-d76f1a2385eb.jpg)

Hexanchus griseus (Hexanchiformes)

![Hexanchus](https://user-images.githubusercontent.com/80922475/154269010-97493fde-35b2-41db-b5be-fdb152e8ea55.jpg)

Squalus acanthias (Squaliformes)

![Squalus](https://user-images.githubusercontent.com/80922475/154268997-0bc01859-76ae-49d4-adc8-86e3e448b90b.jpg)


Heterodontus zebra (Heterodontiformes)

![Heterodontus](https://user-images.githubusercontent.com/80922475/154269004-fa41a2ae-d9fd-4f94-89f8-80692ffda38d.jpg)

Pristiophorus japonicus (Pristiophoriformes)

![Pristiophorus](https://user-images.githubusercontent.com/80922475/154267653-33117072-f8c0-4748-bd18-8cf061fd1df5.jpg)

First the user must specify a species list into your current directory. The list is call list.txt and you must specify the species name in the same way that in the following example : 

![list](https://user-images.githubusercontent.com/80922475/154270445-dcae2558-e269-41f4-9606-9e3aa8020da8.png)

Two master script are presented here:
  The first one is the quickest of the two and lack many steps of checking but remain the best way to have a quick and dirty phylogeny.
  One must pay attention to the data availabilty, because the code will function only for species with refseq mitogenome.
  
  To start the script, the user have just to run the following command line in the directory downloaded from this git : bash QD.sh
  
  At the you will find several file corresponding to the output of Iqtree, comprising a contree.file in the "last" folder, which is the consensus tree from the maximum likelyhood analysis.
  
  I higly recomand the use of figtree as a tree visualizer for the consensus tree as seen in this example
    
![my_aligned_sequences fst contree-1](https://user-images.githubusercontent.com/80922475/154271031-c4d610b1-c47f-4391-af4b-2f9bb318f59c.png)
  
