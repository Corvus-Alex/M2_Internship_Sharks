mkdir out_final
mkdir out_final/cYTBdir
mkdir out_final/nD6dir
mkdir out_final/nD5dir
mkdir out_final/nD4Ldir
mkdir out_final/nD4dir
mkdir out_final/nD3dir
mkdir out_final/nD2dir
mkdir out_final/nD1dir
mkdir out_final/cOX3dir
mkdir out_final/cOX2dir
mkdir out_final/cOX1dir
mkdir out_final/aTP8dir
mkdir out_final/aTP6dir
mkdir out_final/16sdir
mkdir out_final/12sdir

for i in out_align/*; do
        a3=${i##*/}
        realname3="${a3}.fasta"
for C1 in ${i}/*cYTBdir*; do
            python3 rename.py ${C1} "out_final/cYTBdir/${realname3}" ${a3}
done

for C2 in ${i}/*nD6dir*; do
                python3 rename.py ${C2} "out_final/nD6dir/${realname3}" ${a3}
done

for C3 in ${i}/*nD5dir*; do
                python3 rename.py ${C3} "out_final/nD5dir/${realname3}" ${a3}
done

for C4 in ${i}/*nD4Ldir*; do
                python3 rename.py ${C4} "out_final/nD4Ldir/${realname3}" ${a3}
done

for C5 in ${i}/*nD4dir*; do
    		python3 rename.py ${C5} "out_final/nD4dir/${realname3}" ${a3}
done

for C6 in ${i}/*nD3dir*; do
                python3 rename.py ${C6} "out_final/nD3dir/${realname3}" ${a3}
done

for C7 in ${i}/*nD2dir*; do
                python3 rename.py ${C7} "out_final/nD2dir/${realname3}" ${a3}
done

for C8 in ${i}/*nD1dir*; do
                python3 rename.py ${C8} "out_final/nD1dir/${realname3}" ${a3}
done

for C9 in ${i}/*cOX3dir*; do
                python3 rename.py ${C9} "out_final/cOX3dir/${realname3}" ${a3}
done

for C10 in ${i}/*cOX2dir*; do
                python3 rename.py ${C10} "out_final/cOX2dir/${realname3}" ${a3}
done

for C11 in ${i}/*cOX1dir*; do
                python3 rename.py ${C11} "out_final/cOX1dir/${realname3}" ${a3}
done

for C12 in ${i}/*aTP8dir*; do
                python3 rename.py ${C12} "out_final/aTP8dir/${realname3}" ${a3}
done

for C13 in ${i}/*aTP6dir*; do
                python3 rename.py ${C13} "out_final/aTP6dir/${realname3}" ${a3}
done

for C14 in ${i}/*16sdir*; do
                python3 rename.py ${C14} "out_final/16sdir/${realname3}" ${a3}
done

for C15 in ${i}/*12sdir*; do
                python3 rename.py ${C15} "out_final/12sdir/${realname3}" ${a3}
done

done
