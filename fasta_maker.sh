for i in output/*; do
    realname=${i}
    realname=${realname##*/}
    fast="${realname}.fasta"
    echo "${i}/${fast}"
    python3 pycut.py ${i}/${fast} ${i}
    for j in ${i}/*.gbk; do
        python3 pythonextractor_3.0.py ${j}
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
mkdir ${i}/12sdir
mkdir ${i}/16sdir

cp reference/*CYTOCHROMEB* ${i}/cYTBdir
cp reference/*NADHDEHYDROGENASESUBUNIT6* ${i}/nD6dir
cp reference/*NADHDEHYDROGENASESUBUNIT5* ${i}/nD5dir
cp reference/*NADHDEHYDROGENASESUBUNIT4L* ${i}/nD4Ldir
cp reference/*NADHDEHYDROGENASESUBUNIT4.* ${i}/nD4dir
cp reference/*NADHDEHYDROGENASESUBUNIT3* ${i}/nD3dir
cp reference/*NADHDEHYDROGENASESUBUNIT2* ${i}/nD2dir
cp reference/*NADHDEHYDROGENASESUBUNIT1* ${i}/nD1dir
cp reference/*CYTOCHROMECOXIDASESUBUNITI.* ${i}/cOX1dir
cp reference/*CYTOCHROMECOXIDASESUBUNITIII.* ${i}/cOX3dir
cp reference/*CYTOCHROMECOXIDASESUBUNITII.* ${i}/cOX2dir
cp reference/*CYTOCHROMECOXIDASESUBUNIT1* ${i}/cOX1dir
cp reference/*CYTOCHROMECOXIDASESUBUNIT3* ${i}/cOX3dir
cp reference/*CYTOCHROMECOXIDASESUBUNIT2* ${i}/cOX2dir
cp reference/*CYTOCHROMEOXIDASESUBUNIT1* ${i}/cOX1dir
cp reference/*CYTOCHROMEOXIDASESUBUNIT3* ${i}/cOX3dir
cp reference/*CYTOCHROMEOXIDASESUBUNIT2* ${i}/cOX2dir
cp reference/*ATPSYNTHASEF0SUBUNIT8* ${i}/aTP8dir
cp reference/*ATPSYNTHASEF0SUBUNIT6* ${i}/aTP6dir
cp reference/*12S* ${i}/12sdir
cp reference/*16S* ${i}/16sdir
cp reference/*S-RRNA* ${i}/12sdir
cp reference/*L-RRNA* ${i}/16sdir

for C1 in ${i}/*CYTOCHROMEB*; do
    mv ${C1} ${i}/cYTBdir
done

for C2 in ${i}/*NADHDEHYDROGENASESUBUNIT6*; do
    mv ${C2} ${i}/nD6dir
done

for C3 in ${i}/*NADHDEHYDROGENASESUBUNIT5*; do
    mv ${C3} ${i}/nD5dir
done

for C4 in ${i}/*NADHDEHYDROGENASESUBUNIT4L*; do
    mv ${C4} ${i}/nD4Ldir
done

for C5 in ${i}/*NADHDEHYDROGENASESUBUNIT4.*; do
    mv ${C5} ${i}/nD4dir
done

for C6 in ${i}/*NADHDEHYDROGENASESUBUNIT3*; do
    mv ${C6} ${i}/nD3dir
done

for C7 in ${i}/*NADHDEHYDROGENASESUBUNIT2*; do
    mv ${C7} ${i}/nD2dir
done

for C8 in ${i}/*NADHDEHYDROGENASESUBUNIT1*; do
    mv ${C8} ${i}/nD1dir
done

for C9 in ${i}/*CYTOCHROMECOXIDASESUBUNITIII*; do
    mv ${C9} ${i}/cOX3dir
done

for C10 in ${i}/*CYTOCHROMECOXIDASESUBUNITII*; do
    mv ${C10} ${i}/cOX2dir
done

for C11 in ${i}/*CYTOCHROMECOXIDASESUBUNITI*; do
    mv ${C11} ${i}/cOX1dir
done

for C12 in ${i}/*ATPSYNTHASEF0SUBUNIT8*; do
    mv ${C12} ${i}/aTP8dir
done

for C13 in ${i}/*ATPSYNTHASEF0SUBUNIT6*; do
    mv ${C13} ${i}/aTP6dir
done

for C14 in ${i}/*CYTOCHROMECOXIDASESUBUNIT3*; do
    mv ${C14} ${i}/cOX3dir
done

for C15 in ${i}/*CYTOCHROMECOXIDASESUBUNIT2*; do
    mv ${C15} ${i}/cOX2dir
done

for C16 in ${i}/*CYTOCHROMECOXIDASESUBUNIT1*; do
    mv ${C16} ${i}/cOX1dir
done

for C17 in ${i}/*12S*; do
    mv ${C17} ${i}/12sdir
done

for C18 in ${i}/*16S*; do
    mv ${C18} ${i}/16sdir
done
for C20 in ${i}/*S-RRNA*; do
    mv ${C20} ${i}/12sdir
done

for C21 in ${i}/*L-RRNA*; do
    mv ${C21} ${i}/16sdir
done

for C22 in ${i}/*CYTOCHROMEOXIDASESUBUNIT3*; do
    mv ${C22} ${i}/cOX3dir
done

for C23 in ${i}/*CYTOCHROMEOXIDASESUBUNIT2*; do
    mv ${C23} ${i}/cOX2dir
done

for C24 in ${i}/*CYTOCHROMEOXIDASESUBUNIT1*; do
    mv ${C24} ${i}/cOX1dir
done

for C25 in ${i}/*CYTOCHROMEOXIDASESUBUNITIII*; do
    mv ${C25} ${i}/cOX3dir
done

for C26 in ${i}/*CYTOCHROMEOXIDASESUBUNITII*; do
    mv ${C26} ${i}/cOX2dir
done

for C27 in ${i}/*CYTOCHROMEOXIDASESUBUNITI*; do
    mv ${C27} ${i}/cOX1dir
done
rm ${i}/*.fasta
done
