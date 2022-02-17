mkdir out_align
mkdir backup
for a in output/*; do
        a1=${a##*/}
    for b in ${a}/*; do
        a2="out_align/${a1}"
        b1=${b##*/}
        a3=${a2##*/}
        mkdir ${a2}
        realname1="${b}/${a1}_${b1}.fasta"
        realname2="${a2}/${a1}_${b1}_aligned_consensus.faa"
        cat ${b}/*.fasta >> ${realname1}
        python3 rename.py ${realname1} ${realname2} ${a3}
    done
done
