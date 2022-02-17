mkdir out_align
mkdir backup
for a in output/*; do
        a1=${a##*/}
        mkdir backup/${a1}
    for b in ${a}/*; do
        a2="out_align/${a1}"
        b1=${b##*/}
        a3=${a2##*/}
        mkdir ${a2}
        c1="backup/${a1}/${b1}"
        realname="${b}/${a1}_${b1}.fasta"
        realname1="${b}/${a1}_${b1}_cleaned.fasta"
        realname2="${b}/${a1}_${b1}_aligned.fasta"
        realname21="${b}/${a1}_${b1}_alignedc.fasta"
        realname3="${b}/${a1}_${b1}_aligned_consensus.fst"
        realname4="${b}/${a1}_${b1}_aligned0.fasta"
        realname5="${b}/${a1}_${b1}_aligned1_consensus.fst"
        realname6="${a2}/${a1}_${b1}_aligned_consensus.faa"
        mkdir ${c1}
        if [ $(ls ${b}| wc -l) -gt 3 ]; then
        cp $(ls -S ${b}/*.fasta | head -1) "${c1}/backup.fasta"
        cp ${b}/*.fst ${c1}
        cat ${b}/*.fasta >> ${realname}
        java -jar macse_v2.06.jar -prog alignSequences -seq ${realname} -out_NT ${realname1} -gc_def 2
        perl -p -i -e 's/!//g' ${realname1}
        python3 purificator2.py ${realname1} ${realname2}
        perl -p -i -e 's/-//g' ${realname2}
        em_cons ${realname2} ${realname3} -name ${a3}
        cat ${b}/*fst >>${realname4}
        java -jar macse_v2.06.jar -prog alignSequences -seq ${realname4} -out_NT ${realname5} -gc_def 2 -gap_ext 100 -gap_ext_term 0 -gap_op 100 -gap_op_term 0
        perl -p -i -e 's/-/N/g' ${realname5}
        perl -p -i -e 's/!//g' ${realname5}
        python3 purificator.py ${realname5} ${realname6}
               
        fi

        if [ $(ls ${b}| wc -l) -eq 3 ]; then
        cat ${b}/*fasta >> ${realname2}
        python3 rename.py ${realname2} ${realname3} ${a3}
        cat ${b}/*fst >>${realname4}
        java -jar macse_v2.06.jar -prog alignSequences -seq ${realname4} -out_NT ${realname5} -gc_def 2 -gap_ext 100 -gap_ext_term 0 -gap_op 100 -gap_op_term 0
        perl -p -i -e 's/-/N/g' ${realname5}
        perl -p -i -e 's/!//g' ${realname5}
        python3 purificator.py ${realname5} ${realname6}
        
        fi
        
        if [ $(ls ${b}| wc -l) -eq 2 ]; then
        cp ${b}/*.faa ${realname6}
        
        fi
        
        
        
        
        
        rm ${b}/*.fst
        rm ${b}/*.fasta
        rm ${b}/*.csv
    done
done
