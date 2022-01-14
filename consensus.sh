mkdir out_align
for a in output/*; do
    for b in ${a}/*; do
        a1=${a##*/}
        a2="out_align/${a1}"
        b1=${b##*/}
        a3=${a2##*/}
        mkdir ${a2}
        realname="${a2}/${a1}_${b1}.fasta"
        realname2="${a2}/${a1}_${b1}_aligned.fasta"
        realname3="${a2}/${a1}_${b1}_aligned_consensus.fst"
        cat ${b}/* >> ${realname}
        muscle -in ${realname} -out ${realname2}
        em_cons ${realname2} ${realname3} -name ${a3}
        rm ${a2}/*.fasta
    done
    a4="${a2}/${a1}_aligned_consensus_multi.faa"
    cat ${a2}/*.fst >> ${a4}
    a5="${a2}/${a1}_aligned_consensus_multi_cleaned.fasta"
    union -filter ${a4} >> ${a5}
    rm ${a2}/*fst
    rm ${a2}/*faa
done