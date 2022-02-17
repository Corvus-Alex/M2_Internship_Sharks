mkdir output
while read F  ; do
    C=${F}
    realname="${F// /_}"
    mkdir output/${realname}
    (echo "esearch -db nucleotide -query \"${C}[Organism] AND (mitochondrion[All Fields] OR mitochondrion[Filter])\"| efetch -format gp > output/${realname}/${realname}.fasta")>>Asuka.sh
    
done <list.txt

bash Asuka.sh
rm Asuka.sh