seqkit concat last/*.fst >> last/my_aligned_sequences.fst
iqtree2 -s last/my_aligned_sequences.fst -st DNA -o Chimaera_monstrosa -bb 1000 -spp partition_file2.txt -m MFP+MERGE -safe

