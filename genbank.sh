mkdir output
while read F  ; do
    C=${F}
    realname="${F// /_}"
    mkdir output/${realname}
    (echo "esearch -db nucleotide -query \"${C}[Organism] Cytb\"| efetch -format gp > output/${realname}/${realname}.fasta")>>Asuka.sh
    
done <list.txt

bash Asuka.sh
rm Asuka.sh