for a in output/*/; do
for c in output/*; do
    for b in ${a}/*; do
        c1=${c##*/}
        b1=${b##*/}
        realname="output/${c1}_${b1}.fasta"
        realname2="output/${c1}_${b1}_aligned.fasta"
        realname3="output/${c1}_${b1}_aligned_consensus.fst"
        cat ${b}/* >> ${realname}
        muscle -in ${realname} -out ${realname2}
        em_cons ${realname2} ${realname3} -name ${b1}
    done
done
done
rm output/*.fasta