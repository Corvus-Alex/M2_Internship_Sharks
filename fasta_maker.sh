for i in output/*; do
    realname=${i}
    realname=${realname##*/}
    fast="${realname}.fasta"
    echo "${i}/${fast}"
    python3 pycut.py ${i}/${fast} ${i}
    for j in ${i}/*.gbk; do
        python3 pythonextractor_2.0.py ${j}
    done
    for c in ${i}/*.faa; do
        python3 pycut2.py ${c}
    done
    rm ${i}/*.gbk
    rm ${i}/*.faa
mkdir ${i}/cYTBdir
mkdir ${i}/nD6dir
mkdir ${i}/nD5dir
mkdir ${i}/nD4Ldir
mkdir ${i}/nD4dir
mkdir ${i}/nD3dir
mkdir ${i}/nD2dir
mkdir ${i}/nD1dir
mkdir ${i}/cOX3dir
mkdir ${i}/cOX2dir
mkdir ${i}/cOX1dir
mkdir ${i}/aTP8dir
mkdir ${i}/aTP6dir

for C1 in ${i}/*CYTB*; do
    mv ${C1} ${i}/cYTBdir
done

for C2 in ${i}/*ND6*; do
    mv ${C2} ${i}/nD6dir
done

for C3 in ${i}/*ND5*; do
    mv ${C3} ${i}/nD5dir
done

for C4 in ${i}/*ND4L*; do
    mv ${C4} ${i}/nD4Ldir
done

for C5 in ${i}/*ND4*; do
    mv ${C5} ${i}/nD4dir
done

for C6 in ${i}/*ND3*; do
    mv ${C6} ${i}/nD3dir
done

for C7 in ${i}/*ND2*; do
    mv ${C7} ${i}/nD2dir
done

for C8 in ${i}/*ND1*; do
    mv ${C8} ${i}/nD1dir
done

for C9 in ${i}/*COX3*; do
    mv ${C9} ${i}/cOX3dir
done

for C10 in ${i}/*COX2*; do
    mv ${C10} ${i}/cOX2dir
done

for C11 in ${i}/*COX1*; do
    mv ${C11} ${i}/cOX1dir
done

for C12 in ${i}/*ATP8*; do
    mv ${C12} ${i}/aTP8dir
done

for C13 in ${i}/*ATP6*; do
    mv ${C13} ${i}/aTP6dir
done

for C14 in ${i}/*COIII*; do
    mv ${C14} ${i}/cOX3dir
done

for C15 in ${i}/*COII*; do
    mv ${C15} ${i}/cOX2dir/
done

for C16 in ${i}/*COI*; do
    mv ${C16} ${i}/cOX1dir
done

done
