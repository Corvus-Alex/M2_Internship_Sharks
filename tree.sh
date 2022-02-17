seqkit concat last/*.fst >> last/my_aligned_sequences.fst
iqtree -s last/my_aligned_sequences.fst -st DNA -bb 1000 

