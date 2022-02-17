seqkit concat last/*.fst >> last/my_aligned_sequences.fst
iqtree2 -s last/my_aligned_sequences.fst -st DNA -bb 1000 

