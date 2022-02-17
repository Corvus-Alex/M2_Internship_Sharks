mkdir last
for i in out_final/*; do
        realname=${i}
        realname=${realname##*/}
        fast="last/${realname}.fasta"
        output="last/aligned_${realname}.fst"
        cat ${i}/* >>${fast}
        muscle -in ${fast} -out ${output}
done
