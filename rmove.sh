for j in output/*; do
    for c in ${j}/*; do
        if [ $(find ${c} -printf "%s") -eq 0 ]; then
            rm ${c}
        fi
    done
    rmdir ${j}
done
